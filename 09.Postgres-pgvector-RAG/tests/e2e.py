import pytest
from fastapi.testclient import TestClient
from app.main import app

def test_home_page_loads():
    with TestClient(app) as client:
        response = client.get("/")
        assert response.status_code == 200
        assert b"RAG with pgvector" in response.content

def test_rag_query():
    # Because embeddings require Postgres to be running and populated,
    # this test is an integration/E2E test that expects `make up` was run.
    with TestClient(app) as client:
        response = client.post("/", data={"query": "Where is the main campus?"})
        
        assert response.status_code == 200
        
        # We expect the AI Answer section to be present
        assert b"AI Answer:" in response.content
        assert b"Retrieved Context (Sources):" in response.content
        
        # We expect the mock context about North Sydney to be retrieved
        assert b"North Sydney" in response.content

