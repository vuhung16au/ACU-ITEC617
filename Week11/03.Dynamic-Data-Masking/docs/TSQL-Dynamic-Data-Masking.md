# Dynamic Data Masking (DDM) in T-SQL

While this lab uses PostgreSQL Views to simulate masking, **Microsoft SQL Server** and **Azure SQL Database** have Dynamic Data Masking built into the engine via the T-SQL language.

With T-SQL DDM, you do not need to create separate views. You define the masking rules directly on the table columns, and the database engine automatically applies the mask based on the user's permissions.

## 1. Applying the Mask (`ADD MASKED WITH`)

You can alter existing columns to add a masking function:

```tsql
-- Default Masking (returns 0 for numbers, XXXX for strings, 1900-01-01 for dates)
ALTER TABLE sales.customers
ALTER COLUMN salary ADD MASKED WITH (FUNCTION = 'default()');

-- Email Masking (exposes first letter and standardizes the rest, e.g., aXXX@XXXX.com)
ALTER TABLE sales.customers
ALTER COLUMN email ADD MASKED WITH (FUNCTION = 'email()');

-- Partial Masking (customizable string masking)
-- prefix, padding, suffix
ALTER TABLE sales.customers
ALTER COLUMN credit_card ADD MASKED WITH (FUNCTION = 'partial(0, "XXXX-XXXX-XXXX-", 4)');

-- Random Masking (for numeric types)
-- Returns a random value within the specified range
ALTER TABLE sales.customers
ALTER COLUMN phone ADD MASKED WITH (FUNCTION = 'random(1000000, 9999999)');
```

## 2. The `UNMASK` Permission

In T-SQL, users without the `UNMASK` permission will automatically see the masked data when querying the table. 

Users who need to see the real data (like our Finance Manager) must be granted the `UNMASK` permission.

```tsql
-- Grant UNMASK to the FinanceManager role
GRANT UNMASK TO FinanceManager;
```

## 3. How it Works in Practice

If `charlie_regular` (who does NOT have `UNMASK`) runs:
```tsql
SELECT * FROM sales.customers;
```
He will see:
`John | Doe | jXXX@XXXX.com | 1582931 | XXXX-XXXX-XXXX-4444 | 0.00`

If `bob_finance` (who HAS `UNMASK`) runs the exact same query:
```tsql
SELECT * FROM sales.customers;
```
He will see the raw, unmasked data.
