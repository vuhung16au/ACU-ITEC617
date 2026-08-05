"""
Intentionally vulnerable SQL Injection teaching app.

Educational use only. The vulnerable_* helpers concatenate user input into
raw SQL so students can practise in-band, blind, and out-of-band techniques.
"""

from pathlib import Path

from fastapi import FastAPI, Form, Query, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from psycopg import Error as PsycopgError

from database import (
    secure_login,
    secure_search,
    secure_user_exists,
    vulnerable_login,
    vulnerable_search,
    vulnerable_user_exists,
)

BASE_DIR = Path(__file__).resolve().parent

app = FastAPI(
    title="SQL Injection Demo",
    description="Educational demo of SQL injection against a Python + PostgreSQL app.",
    version="1.0.0",
)

app.mount("/static", StaticFiles(directory=BASE_DIR / "static"), name="static")
templates = Jinja2Templates(directory=str(BASE_DIR / "templates"))


@app.get("/", response_class=HTMLResponse)
def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


@app.get("/health")
def health():
    return {"status": "ok"}


# ---------------------------------------------------------------------------
# Vulnerable endpoints (raw SQL + string concatenation)
# ---------------------------------------------------------------------------

@app.post("/vulnerable/login", response_class=HTMLResponse)
def vuln_login(
    request: Request,
    username: str = Form(...),
    password: str = Form(...),
):
    try:
        query, rows = vulnerable_login(username, password)
        return templates.TemplateResponse(
            "result.html",
            {
                "request": request,
                "title": "Vulnerable login",
                "mode": "vulnerable",
                "query": query,
                "success": len(rows) > 0,
                "message": (
                    f"Welcome, {rows[0]['username']} ({rows[0]['email']})."
                    if rows
                    else "Login failed — invalid username or password."
                ),
                "rows": rows,
                "note": (
                    "Successful login does not display passwords. "
                    "Try a UNION payload on the Search form to extract them."
                ),
            },
        )
    except PsycopgError as exc:
        query = (
            f"SELECT id, username, email FROM users "
            f"WHERE username = '{username}' AND password = '{password}'"
        )
        return _error_page(request, "Vulnerable login", str(exc), query)


@app.post("/vulnerable/search", response_class=HTMLResponse)
def vuln_search(request: Request, username: str = Form(...)):
    """
    In-band attack surface: returns query results (and raw DB errors).

    UNION example (username field):
      ' UNION SELECT username, password FROM users--
    """
    try:
        query, rows = vulnerable_search(username)
        return templates.TemplateResponse(
            "result.html",
            {
                "request": request,
                "title": "Vulnerable search",
                "mode": "vulnerable",
                "query": query,
                "success": True,
                "message": f"Found {len(rows)} row(s). Columns shown: username, email.",
                "rows": rows,
                "note": (
                    "A UNION injection can place password values into the email column. "
                    "Error-based payloads may also leak schema details via the error page."
                ),
            },
        )
    except PsycopgError as exc:
        # Intentional: surface database errors for error-based SQLi demos.
        return _error_page(request, "Vulnerable search", str(exc), _build_search_query(username))


@app.get("/vulnerable/check", response_class=HTMLResponse)
def vuln_check(request: Request, username: str = Query(...)):
    """
    Inferential (boolean-blind) surface: response text differs for true/false.

    Example:
      admin' AND (SELECT SUBSTRING(password,1,1) FROM users WHERE username='admin')='A'--
    """
    try:
        query, exists = vulnerable_user_exists(username)
        return templates.TemplateResponse(
            "result.html",
            {
                "request": request,
                "title": "Vulnerable existence check (boolean blind)",
                "mode": "vulnerable",
                "query": query,
                "success": exists,
                "message": "User found." if exists else "User not found.",
                "rows": [],
                "note": (
                    "Only the message changes — no row data is returned. "
                    "For time-based blind, inject pg_sleep(5) and time the response."
                ),
            },
        )
    except PsycopgError as exc:
        return _error_page(request, "Vulnerable check", str(exc), None)


# ---------------------------------------------------------------------------
# Secure endpoints (parameterised queries)
# ---------------------------------------------------------------------------

@app.post("/secure/login", response_class=HTMLResponse)
def ok_login(
    request: Request,
    username: str = Form(...),
    password: str = Form(...),
):
    try:
        query, rows = secure_login(username, password)
        return templates.TemplateResponse(
            "result.html",
            {
                "request": request,
                "title": "Secure login",
                "mode": "secure",
                "query": query,
                "success": len(rows) > 0,
                "message": (
                    f"Welcome, {rows[0]['username']} ({rows[0]['email']})."
                    if rows
                    else "Login failed — invalid username or password."
                ),
                "rows": rows,
                "note": "Payloads are bound as data, so quotes and UNION clauses cannot change the query structure.",
            },
        )
    except PsycopgError as exc:
        return _error_page(request, "Secure login", str(exc), None)


@app.post("/secure/search", response_class=HTMLResponse)
def ok_search(request: Request, username: str = Form(...)):
    try:
        query, rows = secure_search(username)
        return templates.TemplateResponse(
            "result.html",
            {
                "request": request,
                "title": "Secure search",
                "mode": "secure",
                "query": query,
                "success": True,
                "message": f"Found {len(rows)} row(s).",
                "rows": rows,
                "note": "The same UNION payload that works on the vulnerable search will fail here.",
            },
        )
    except PsycopgError as exc:
        return _error_page(request, "Secure search", str(exc), None)


@app.get("/secure/check", response_class=HTMLResponse)
def ok_check(request: Request, username: str = Query(...)):
    try:
        query, exists = secure_user_exists(username)
        return templates.TemplateResponse(
            "result.html",
            {
                "request": request,
                "title": "Secure existence check",
                "mode": "secure",
                "query": query,
                "success": exists,
                "message": "User found." if exists else "User not found.",
                "rows": [],
                "note": "Boolean and time-based payloads are treated as literal usernames.",
            },
        )
    except PsycopgError as exc:
        return _error_page(request, "Secure check", str(exc), None)


def _build_search_query(username: str) -> str:
    return f"SELECT username, email FROM users WHERE username = '{username}'"


def _error_page(request: Request, title: str, error: str, query: str | None):
    return templates.TemplateResponse(
        "error.html",
        {
            "request": request,
            "title": title,
            "error": error,
            "query": query,
        },
        status_code=500,
    )
