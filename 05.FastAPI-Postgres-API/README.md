# 05.FastAPI-Postgres-API

This sample project demonstrates how to build a robust backend API using **FastAPI** and **PostgreSQL**, running entirely within Docker containers.

## Learning Objectives

In this project, you will learn:
- How to create a pure backend API (without any frontend application).
- How to connect to a PostgreSQL database using both **Raw SQL** (`psycopg`) and an **ORM** (`SQLAlchemy`).
- How to use Docker and Docker Compose to orchestrate a database, a database administration tool (pgAdmin), and an API server.
- The fundamental concepts of APIs, including reusability, pagination, and security.

## Project Structure

- `app/`: Contains the FastAPI application and database interaction logic.
- `docs/`: Covers theoretical concepts around APIs and data access patterns.
- `init-scripts/`: Contains SQL scripts to automatically seed the database with mock data.
- `tests/`: Contains automated end-to-end tests for the API.

## Screenshots & Screencasts

Visual aids demonstrating the API in action can be found in the `images/` directory.

## Getting Started

Please refer to [QUICKSTART.md](QUICKSTART.md) for instructions on how to run and interact with this example.
