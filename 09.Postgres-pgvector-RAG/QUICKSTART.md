# Quickstart Guide

This guide will help you spin up the PostgreSQL database (with pgvector), run the FastAPI backend, and test the RAG implementation.

## 1. Start the Database Environment

This project uses Docker Compose to run PostgreSQL (with the `pgvector` extension) and pgAdmin.

Ensure Docker is running, then execute:
```bash
make up
```

## 2. Verify Services

- **pgAdmin (PostgreSQL UI)**: Go to `http://localhost:5050`. The database is pre-loaded; just enter the password `password` when prompted. You can inspect the `documents` table to see the raw text and the high-dimensional `vector` data type.

## 3. Run the FastAPI Application

In a new terminal window, ensure you have the python environment setup using `uv`. The dependencies should already be installed, but if not:
```bash
uv sync
```

Start the FastAPI development server:
```bash
make run
```
*Note: On the very first run, it will take some time to download the local AI models (`all-MiniLM-L6-v2` and `google/flan-t5-small`) and compute the initial embeddings for the mock data.*

Open your browser and navigate to `http://localhost:8000`. 
Type in a query (e.g., "Where are the evening classes held?").

## 4. Run E2E Tests

To verify the semantic search functionality:
```bash
make e2e
```

## 5. Teardown

To stop and remove all containers:
```bash
make down
```
