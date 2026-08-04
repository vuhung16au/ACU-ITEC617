# Quickstart Guide

This guide walks you through implementing Dynamic Data Masking concepts using PostgreSQL Views.

## 1. Start the Environment

Open your terminal, navigate to this folder (`Week11/03.Dynamic-Data-Masking`), and run:
```bash
make up
```

## 2. Access pgAdmin

1. Open your web browser and navigate to [http://localhost:5050](http://localhost:5050).
2. Expand **Servers** -> **ITEC617 - Week 11 DB (Data Masking)**.
3. Enter the password: `password`.
4. Open the **Query Tool**.

## 3. Exercises: Implementing Masking with Views

Since PostgreSQL does not have a native `ADD MASKED WITH` syntax like T-SQL, we use standard SQL Views to achieve the exact same security outcome.

### Exercise 1: Create the Masked View
We will create a view that uses string manipulation functions to mask the data.

```sql
CREATE VIEW sales.masked_customers AS
SELECT 
    customer_id,
    first_name,
    last_name,
    -- Default Masking: Replace string entirely
    'XXXX@XXXX.com'::VARCHAR AS email,
    
    -- Partial Masking: Show first 2 and last 2, mask middle (for a 8 char phone number)
    SUBSTRING(phone FROM 1 FOR 2) || 'XXXX' || SUBSTRING(phone FROM 7 FOR 2) AS phone,
    
    -- Partial Masking: Credit Card (Show only last 4 digits)
    'XXXX-XXXX-XXXX-' || SUBSTRING(credit_card FROM 16 FOR 4) AS credit_card,
    
    -- Default Masking for Numbers: Return 0
    0.00::DECIMAL AS salary
FROM sales.customers;
```

### Exercise 2: Assign Permissions
Grant access to the view to the `RegularUser`, while ensuring they do NOT have access to the base table.

```sql
GRANT SELECT ON sales.masked_customers TO RegularUser;
```
*(Note: `FinanceManager` was already granted access to the base table in the init script, simulating the `UNMASK` permission).*

### Exercise 3: Test the Masking

Switch to the `RegularUser` to see the masked data:

```sql
SET ROLE charlie_regular;

-- This succeeds and shows masked data
SELECT * FROM sales.masked_customers;

-- This fails (permission denied to the base table)
SELECT * FROM sales.customers;

RESET ROLE;
```

Now, switch to the `FinanceManager` to see the unmasked data:

```sql
SET ROLE bob_finance;

-- The Finance manager can query the base table directly to see the real data
SELECT * FROM sales.customers;

RESET ROLE;
```

## 4. Learn the T-SQL Way
To see how this is done natively in Microsoft SQL Server and Azure SQL Database, read [docs/TSQL-Dynamic-Data-Masking.md](docs/TSQL-Dynamic-Data-Masking.md).

## 5. Stop the Environment
Run `make down` in the terminal when finished.
