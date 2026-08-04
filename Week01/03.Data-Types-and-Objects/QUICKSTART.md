# Quickstart Guide

## 1. Start the Environment

Navigate your terminal to this directory (`Week01/03.Data-Types-and-Objects`) and run:

```bash
docker compose up -d
```

This will start PostgreSQL and pgAdmin. The initialization script will automatically create the tables, views, indexes, and functions.

## 2. Access pgAdmin

1. Open [http://localhost:5050](http://localhost:5050) in your browser.
2. Login with:
   - **Email:** `admin@admin.com`
   - **Password:** `root`

## 3. Connect to PostgreSQL

1. In pgAdmin, click **Add New Server**.
2. Name it (e.g., `Local Postgres`).
3. In the **Connection** tab:
   - **Host name/address:** `postgres`
   - **Port:** `5432`
   - **Maintenance database:** `itec617`
   - **Username:** `user`
   - **Password:** `password`
4. Click **Save**.

## 4. Explore the Objects

Navigate to **Schemas > public**:
- **Tables**: View `employees` (Structured), `api_logs` (Semi-structured using JSONB), and `document_store` (Unstructured using TEXT).
- **Views**: Find the `high_earners` view. Right-click and "View/Edit Data" to see how it acts like a table but is actually a saved query.
- **Functions**: Find `give_raise`. You can execute it via the Query Tool to see how it modifies the `employees` table.

## 5. Stop the Environment

```bash
docker compose down
```
