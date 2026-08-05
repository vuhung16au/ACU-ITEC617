# Quickstart Guide

This project includes a Python FastAPI backend and a Web UI for the SQLite database.

## Prerequisites
* Docker and Docker Compose installed.

## Running the Project
1. Open your terminal in this directory (`01.Sqlite-RawSQL`).
2. Run the environment:
   ```bash
   make up
   ```
3. The database will automatically initialize with mock data.

## Accessing the Web UI
We use `sqlite-web` to provide a Web UI for the SQLite database.
* **Database Web UI:** Open [http://localhost:8080](http://localhost:8080) in your browser to view and query the SQLite tables.

## Accessing the Application API
* **FastAPI Backend:** Open [http://localhost:8000](http://localhost:8000)
* **API Docs (Swagger):** Open [http://localhost:8000/docs](http://localhost:8000/docs)

## Running Tests
Run the end-to-end tests to verify the setup:
```bash
make test
```

## Stopping the Project
```bash
make down
```
