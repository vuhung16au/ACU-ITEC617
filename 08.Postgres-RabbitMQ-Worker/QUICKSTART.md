# Quickstart Guide

This guide will help you spin up the environment (PostgreSQL, RabbitMQ, Node Worker) and run the Next.js application.

## 1. Start the Environment

This project uses Docker Compose to run PostgreSQL, pgAdmin, RabbitMQ (with management UI), and a separate Node.js background worker container.

Ensure Docker is running, then execute:
```bash
make up
```

## 2. Verify Services

- **RabbitMQ Management UI**: Go to `http://localhost:15672` (Username: `guest`, Password: `guest`). You can view the message queues here.
- **pgAdmin (PostgreSQL UI)**: Go to `http://localhost:5050`. The database is pre-loaded; just enter the password `password` when prompted.

## 3. Run the Next.js API & Frontend

In a new terminal window, ensure you have dependencies installed:
```bash
npm install
```

Start the Next.js development server:
```bash
npm run dev
```

Open your browser and navigate to `http://localhost:3000`. You can create new "Orders" from the UI.
When an order is created, the API will save it to PostgreSQL and push an event to RabbitMQ.

## 4. Observe the Worker

The background worker is running inside Docker. You can view its logs to see it consuming and processing messages in real-time:
```bash
docker logs -f worker-08-Postgres-RabbitMQ-Worker
```

## 5. Run E2E Tests

To verify that the entire flow works from end-to-end:
```bash
make e2e
```

## 6. Teardown

To stop and remove all containers:
```bash
make down
```
