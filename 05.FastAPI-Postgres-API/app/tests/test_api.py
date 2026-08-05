import pytest
import httpx
import time
from urllib.parse import urljoin

BASE_URL = "http://localhost:8000"

@pytest.fixture(scope="session")
def api_client():
    # In a docker environment, wait a bit for the api and DB to be fully ready
    time.sleep(2)
    with httpx.Client(base_url=BASE_URL) as client:
        yield client

def test_read_root(api_client):
    response = api_client.get("/")
    assert response.status_code == 200
    assert "message" in response.json()

def test_get_students(api_client):
    response = api_client.get("/students")
    assert response.status_code == 200
    
    data = response.json()
    assert isinstance(data, list)
    
    # We should have mock data from the init-script
    assert len(data) > 0
    
    # Check the structure of the first item
    first_student = data[0]
    assert "id" in first_student
    assert "first_name" in first_student
    assert "last_name" in first_student
    assert "email" in first_student
