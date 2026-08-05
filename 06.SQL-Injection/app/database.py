"""
Database helpers for the SQL Injection demo.

Two styles are provided side-by-side:
  - vulnerable_*  : builds SQL with string concatenation (UNSAFE — for teaching only)
  - secure_*      : uses parameterised queries (the correct approach)
"""

from typing import Any

import psycopg
from psycopg.rows import dict_row

from config import DATABASE_URL


def get_connection():
    return psycopg.connect(DATABASE_URL, row_factory=dict_row)


# ---------------------------------------------------------------------------
# VULNERABLE — string concatenation. Do not copy this pattern into real apps.
# ---------------------------------------------------------------------------

def vulnerable_login(username: str, password: str) -> tuple[str, list[dict[str, Any]]]:
    """Authenticate by concatenating user input into the SQL string."""
    query = (
        f"SELECT id, username, email FROM users "
        f"WHERE username = '{username}' AND password = '{password}'"
    )
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query)
            rows = cur.fetchall()
    return query, rows


def vulnerable_search(username: str) -> tuple[str, list[dict[str, Any]]]:
    """
    Look up a user by username.

    Returns username and email only — passwords are not selected on purpose.
    A UNION-based injection can still pull passwords into these columns.
    """
    query = (
        f"SELECT username, email FROM users "
        f"WHERE username = '{username}'"
    )
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query)
            rows = cur.fetchall()
    return query, rows


def vulnerable_user_exists(username: str) -> tuple[str, bool]:
    """
    Boolean-blind style check: only reports whether any row matched.

    Attackers inject conditions and observe 'found' vs 'not found'.
    """
    query = f"SELECT 1 FROM users WHERE username = '{username}'"
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query)
            row = cur.fetchone()
    return query, row is not None


# ---------------------------------------------------------------------------
# SECURE — parameterised queries bind values separately from SQL structure.
# ---------------------------------------------------------------------------

def secure_login(username: str, password: str) -> tuple[str, list[dict[str, Any]]]:
    query = (
        "SELECT id, username, email FROM users "
        "WHERE username = %s AND password = %s"
    )
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query, (username, password))
            rows = cur.fetchall()
    return query, rows


def secure_search(username: str) -> tuple[str, list[dict[str, Any]]]:
    query = "SELECT username, email FROM users WHERE username = %s"
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query, (username,))
            rows = cur.fetchall()
    return query, rows


def secure_user_exists(username: str) -> tuple[str, bool]:
    query = "SELECT 1 FROM users WHERE username = %s"
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query, (username,))
            row = cur.fetchone()
    return query, row is not None
