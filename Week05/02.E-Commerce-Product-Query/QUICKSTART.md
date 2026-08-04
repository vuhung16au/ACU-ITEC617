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
3.  On the left panel, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 05 DB (Topic 2)**.
4.  When prompted for a password, enter: `password` (You only need to do this once per session).
5.  Expand **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see the `Products` table.

## 3. Practice SQL

1.  Right-click on the **itec617** database and select **Query Tool**.
2.  Try running the following tasks in the Query Tool:

**Task 1: Find all products under $50**
```sql
SELECT * FROM "Products" WHERE "UnitPrice" < 50;
```

**Task 2: Calculate discounted prices (20% off)**
```sql
SELECT "ProductName", "UnitPrice", ("UnitPrice" * 0.8) AS "DiscountedPrice" FROM "Products";
```

**Task 3: Use LIKE to find products containing "Laptop"**
```sql
SELECT * FROM "Products" WHERE "ProductName" LIKE '%Laptop%';
```

**Task 4: Use BETWEEN to find products priced $100-$500**
```sql
SELECT * FROM "Products" WHERE "UnitPrice" BETWEEN 100 AND 500;
```

**Task 5: Use IN to filter by multiple categories**
```sql
SELECT * FROM "Products" WHERE "Category" IN ('Electronics', 'Accessories');
```

**Task 6: Find out-of-stock items**
```sql
SELECT * FROM "Products" WHERE "StockQuantity" = 0 OR "StockQuantity" IS NULL;
```

**Task 7: Sort results by price (descending) then name (ascending)**
```sql
SELECT * FROM "Products" ORDER BY "UnitPrice" DESC, "ProductName" ASC;
```

## 4. Stop the Environment

When you are finished, run the following command to stop and remove the containers:

```bash
make down
```
