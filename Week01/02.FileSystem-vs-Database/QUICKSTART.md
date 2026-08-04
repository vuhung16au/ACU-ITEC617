# Quickstart Guide

## 1. Start the Environment

Navigate your terminal to this directory (`Week01/02.FileSystem-vs-Database`) and run:

```bash
make up
```

This will start PostgreSQL and pgAdmin. The initialization script in `init-scripts/` will automatically create the sample tables.

## 2. Access pgAdmin

1. Open [http://localhost:5050](http://localhost:5050) in your browser.
2. There is **no** pgAdmin email/password login screen — you go straight to the dashboard.
3. On the left, under **Servers**, expand **ITEC617 - Week 1 DB**.
4. When prompted, enter the database password only: `password` (once per session).

## 3. Explore the Data

Navigate to **Schemas > public > Tables**. You will see three tables:
- `flat_orders`: Represents how data looks in a flat file with redundant information.
- `customers` & `orders`: Represents the normalized, relational database solution.

Right-click these tables and select **View/Edit Data > All Rows** to compare them.

To run SQL, open **Tools → Query Tool**.

## 4. Stop the Environment

```bash
make down
```
