# Quickstart Guide

This guide will help you spin up the database and run the Next.js application.

## 1. Start the Environment

This project uses Docker Compose to run a MongoDB database and Mongo-Express (a Web UI for MongoDB).
Ensure Docker is running on your machine, then execute:

```bash
make up
```

This starts the database and the web interface in the background.

## 2. Access the Database Web UI

A synthetic dataset is automatically seeded when the database container starts for the first time.
To view this data:

1. Open your browser and go to: `http://localhost:8081`
2. You will be prompted for credentials to access Mongo-Express:
   - **Username:** `admin`
   - **Password:** `password`
3. Click on the `itec617` database to view the collections (e.g., `users`).

## 3. Run the Next.js Application

In a new terminal window, ensure you have the dependencies installed:

```bash
npm install
```

Start the development server:

```bash
npm run dev
```

Open your browser and navigate to `http://localhost:3000` to see the application interacting with the MongoDB database.

## 4. Run Tests

To verify that the API and frontend render correctly from the database, run the end-to-end tests:

```bash
make e2e
```

## 5. Teardown

When you are done, you can stop and remove the containers by running:

```bash
make down
```
