# Quickstart Guide

This guide explains how to start the environment and interact with the database.

## 1. Start the Environment

Navigate to this directory in your terminal and run the following command to start the PostgreSQL database and pgAdmin containers:

```bash
make up
```

## 2. Connect to the Database (Seamless Setup)

1.  Open your web browser and navigate to [http://localhost:5050](http://localhost:5050).
2.  *Note: You will bypass the pgAdmin email/password login screen entirely.*
3.  On the left panel, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 05 DB**.
4.  When prompted for a password, enter: `password` (You only need to do this once per session).
5.  Expand **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see the created tables (`Books`, `Members`, `Loans`).

## 3. Practice SQL

1.  Right-click on the **itec617** database and select **Query Tool**.
2.  Try running the following tasks in the Query Tool:

**Task 1: Add the ISBN column to the Books table**
```sql
ALTER TABLE "Books" ADD COLUMN "ISBN" VARCHAR(20);
```

**Task 2: Try a safe deletion (This should fail due to foreign key constraints)**
```sql
-- This will fail because the Loans table references Books
DROP TABLE "Books";
```

## 4. Stop the Environment

When you are finished, run the following command to stop and remove the containers:

```bash
make down
```
