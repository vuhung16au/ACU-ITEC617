# Quickstart Guide

This guide provides step-by-step instructions on how to run, connect to, and interact with the FastAPI and PostgreSQL backend API.

## 1. Prerequisites

Ensure you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running on your machine.
Ensure you have `make` installed.

## 2. Start the Environment

Navigate to this directory in your terminal and run the following command to bring up the Docker containers in the background:

```bash
make up
```

This will start:
- The PostgreSQL database on port `5432`
- The pgAdmin web interface on port `5050`
- The FastAPI application on port `8000`

## 3. Interact with the API

### Via Swagger UI (Interactive Web Browser)

FastAPI automatically generates interactive API documentation.
Open your web browser and go to:
[http://localhost:8000/docs](http://localhost:8000/docs)

You can use this interface to test the `/students` endpoint directly from your browser.

### Via Command Line (`curl`)

You can also use the command line to fetch data from the API:

```bash
curl http://localhost:8000/students
```

If you want to view the JSON output in a pretty format, you can pipe it to `jq`:
```bash
curl -s http://localhost:8000/students | jq
```

## 4. Toggling Between Raw SQL and ORM

This project supports fetching data using either **Raw SQL** (via `psycopg`) or an **ORM** (via `SQLAlchemy`).

1. Open the file `app/config.py`.
2. Change the `USE_ORM` variable:
   - Set `USE_ORM = False` to use Raw SQL.
   - Set `USE_ORM = True` to use SQLAlchemy.
3. The FastAPI container uses hot-reloading (via `uvicorn --reload`), so simply saving the file will automatically restart the server with the new configuration.

## 5. Access the Database via Web UI (pgAdmin)

1. Open your browser and go to [http://localhost:5050](http://localhost:5050).
2. Login with the credentials defined in the `docker-compose.yaml` (default: `admin@admin.com` / `admin`).
3. To connect to the database server, add a new server in pgAdmin:
   - **Name**: `Postgres DB`
   - **Connection > Host name/address**: `postgres-db-05-FastAPI-API`
   - **Connection > Username**: `postgres`
   - **Connection > Password**: `postgres`
4. You can now view the `australian_students` table and its data.

## 6. Stop the Environment

When you are finished, stop the containers and clean up the resources by running:

```bash
make down
```
