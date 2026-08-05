import time

import httpx
import pytest

BASE_URL = "http://localhost:8000"


@pytest.fixture(scope="session")
def client():
    # Allow the web app and database a moment to become ready inside Compose.
    deadline = time.time() + 60
    last_error = None
    while time.time() < deadline:
        try:
            with httpx.Client(base_url=BASE_URL, timeout=30.0) as c:
                response = c.get("/health")
                if response.status_code == 200:
                    yield c
                    return
        except Exception as exc:  # noqa: BLE001 — retry until ready
            last_error = exc
            time.sleep(2)
    raise RuntimeError(f"Web app not ready: {last_error}")


def test_health(client):
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_home_page(client):
    response = client.get("/")
    assert response.status_code == 200
    assert "SQL Injection" in response.text


def test_secure_login_success(client):
    response = client.post(
        "/secure/login",
        data={"username": "admin", "password": "Adm1nS3cret!"},
    )
    assert response.status_code == 200
    assert "Welcome, admin" in response.text


def test_secure_login_rejects_injection(client):
    response = client.post(
        "/secure/login",
        data={"username": "admin'--", "password": "x"},
    )
    assert response.status_code == 200
    assert "Login failed" in response.text


def test_vulnerable_login_bypass(client):
    response = client.post(
        "/vulnerable/login",
        data={"username": "admin'--", "password": "x"},
    )
    assert response.status_code == 200
    assert "Welcome, admin" in response.text


def test_vulnerable_union_extracts_password(client):
    payload = "' UNION SELECT username, password FROM users--"
    response = client.post("/vulnerable/search", data={"username": payload})
    assert response.status_code == 200
    # Passwords from seed data must appear in the response body.
    assert "Adm1nS3cret!" in response.text
    assert "CoffeeSydney2024" in response.text


def test_secure_search_blocks_union(client):
    payload = "' UNION SELECT username, password FROM users--"
    response = client.post("/secure/search", data={"username": payload})
    assert response.status_code == 200
    assert "Adm1nS3cret!" not in response.text
    assert "CoffeeSydney2024" not in response.text


def test_vulnerable_boolean_true_vs_false(client):
    true_resp = client.get("/vulnerable/check", params={"username": "admin' AND '1'='1"})
    false_resp = client.get("/vulnerable/check", params={"username": "admin' AND '1'='2"})
    assert true_resp.status_code == 200
    assert false_resp.status_code == 200
    assert "User found" in true_resp.text
    assert "User not found" in false_resp.text


def test_vulnerable_error_based_leaks_password(client):
    payload = (
        "' AND 1=CAST((SELECT password FROM users WHERE username='admin') AS int)--"
    )
    response = client.post("/vulnerable/search", data={"username": payload})
    assert response.status_code == 500
    assert "Adm1nS3cret!" in response.text
