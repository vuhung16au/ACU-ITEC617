# Quickstart Guide

## 1. Start the Environment

Navigate your terminal to this directory (`Week01/03.Data-Types-and-Objects`) and run:

```bash
make up
```

This will start PostgreSQL and pgAdmin. The initialization script will automatically create the tables, views, indexes, and functions.

## 2. Access pgAdmin

1. Open [http://localhost:5050](http://localhost:5050) in your browser.
2. There is **no** pgAdmin email/password login screen — you go straight to the dashboard.
3. On the left, under **Servers**, expand **ITEC617 - Week 1 DB**.
4. When prompted, enter the database password only: `password` (once per session).

## 3. Explore the Objects

Navigate to **Schemas > public**:
- **Tables**: View `employees` (Structured), `api_logs` (Semi-structured using JSONB), and `document_store` (Unstructured using TEXT).
- **Views**: Find the `high_earners` view. Right-click and "View/Edit Data" to see how it acts like a table but is actually a saved query.
- **Functions**: Find `give_raise`. You can execute it via the Query Tool to see how it modifies the `employees` table.

To run SQL, open **Tools → Query Tool**.

## 4. Stop the Environment

```bash
make down
```
