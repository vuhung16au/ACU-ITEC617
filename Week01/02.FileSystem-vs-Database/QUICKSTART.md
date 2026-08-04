# Quickstart Guide

## 1. Start the Environment

Navigate your terminal to this directory (`Week01/02.FileSystem-vs-Database`) and run:

```bash
docker compose up -d
```

This will start PostgreSQL and pgAdmin. The initialization script in `init-scripts/` will automatically create the sample tables.

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

## 4. Explore the Data

Navigate to **Schemas > public > Tables**. You will see three tables:
- `flat_orders`: Represents how data looks in a flat file with redundant information.
- `customers` & `orders`: Represents the normalized, relational database solution.

Right-click these tables and select **View/Edit Data > All Rows** to compare them.

## 5. Stop the Environment

```bash
docker compose down
```
