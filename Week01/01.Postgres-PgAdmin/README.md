# Week 01: PostgreSQL and pgAdmin with Docker

This folder contains the setup for running a PostgreSQL database and a pgAdmin web interface using Docker Compose. It also includes an initialization script to automatically create a `Students` table and populate it with 100 sample records.

## Contents

- `docker-compose.yaml`: The configuration file to define and run the multi-container application.
- `QUICKSTART.md`: A step-by-step guide on how to start the environment and connect to the database.
- `init-scripts/`: Contains SQL scripts (like `01-create-seed-students.sql`) that are automatically executed the first time the Postgres database starts. This handles creating the `Students` table and seeding the sample data.
