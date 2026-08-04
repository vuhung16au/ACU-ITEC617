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
3.  On the left panel, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 05 DB (Topic 4)**.
4.  When prompted for a password, enter: `password` (You only need to do this once per session).
5.  Expand **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see the `Employees` table.

## 3. Practice SQL

1.  Right-click on the **itec617** database and select **Query Tool**.
2.  Try running the following tasks in the Query Tool:

**Task 1: Insert 3 new employees using a single statement**
```sql
INSERT INTO "Employees" ("FirstName", "LastName", "Department", "Salary", "HireDate") VALUES
('Eve', 'Davis', 'HR', 70000, '2023-11-01'),
('Frank', 'Miller', 'IT', 95000, '2023-11-05'),
('Grace', 'Wilson', 'Sales', 65000, '2023-11-10');
```

**Task 2: Give all IT department employees a 15% raise**
```sql
UPDATE "Employees" 
SET "Salary" = "Salary" * 1.15
WHERE "Department" = 'IT';
```

**Task 3: Safe testing with transactions**
```sql
BEGIN; -- Start a transaction
UPDATE "Employees" SET "Salary" = 50000; -- Oops! Forgot the WHERE clause. Everyone is now making 50k.
SELECT * FROM "Employees"; -- See the disaster
ROLLBACK; -- Undo the mistake! 
-- (If it was correct, you would run COMMIT; instead)
```

**Task 4: Implement "soft delete" by adding an IsActive column**
```sql
ALTER TABLE "Employees" ADD COLUMN "IsActive" BOOLEAN DEFAULT TRUE;

-- "Soft delete" an employee by marking them inactive
UPDATE "Employees" 
SET "IsActive" = FALSE 
WHERE "EmpID" = 2;
```

**Task 5: Delete employees hired before a specific date ("hard delete")**
```sql
DELETE FROM "Employees" 
WHERE "HireDate" < '2019-01-01';
```

## 4. Stop the Environment

When you are finished, run the following command to stop and remove the containers:

```bash
make down
```
