# Quickstart Guide

This project includes a Next.js frontend/backend and a Web UI for the SQLite database.

## Prerequisites
* Docker and Docker Compose installed.
* Node.js and npm (for local development outside of Docker).

## Running the Project
1. Open your terminal in this directory (`02.Sqlite-Nextjs-RawSQL`).
2. Run the environment:
   ```bash
   make up
   ```
3. The database will automatically initialize with mock Australian data.

## Accessing the Database Web UI
**Important:** We use `sqlite-web` to provide a graphical interface for the SQLite database.
* Open [http://localhost:8080](http://localhost:8080) in your browser to view and execute queries directly against the `database.sqlite` file.

## Accessing the Web Application
* Open [http://localhost:3000](http://localhost:3000) to view the Next.js application displaying data from the SQLite database.

## Running Tests
Run the end-to-end tests to verify the setup:
```bash
make test
```

## Stopping the Project
```bash
make down
```

## Deploying
This project is Vercel-ready. To deploy:
```bash
make deploy
```
