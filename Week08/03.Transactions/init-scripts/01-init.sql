-- DDL

CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    balance NUMERIC(10, 2) CHECK (balance >= 0) -- Constraint prevents negative balance
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    stock_quantity INT CHECK (stock_quantity >= 0),
    price NUMERIC(10, 2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    total_price NUMERIC(10, 2)
);

-- DML
INSERT INTO accounts (customer_name, balance) VALUES
('Alice', 1000.00),
('Bob', 500.00),
('Charlie', 150.00);

INSERT INTO products (product_name, stock_quantity, price) VALUES
('Laptop', 10, 1200.00),
('Smartphone', 20, 800.00),
('Headphones', 50, 100.00);


-- NOTE TO STUDENTS:
-- Do NOT run these transaction scripts directly via the full script execution in pgAdmin.
-- Run these scripts line by line or block by block in the Query Tool to observe the behavior!

-- ---------------------------------------------------------
-- Example 1: Successful Bank Transfer
-- ---------------------------------------------------------
/*
BEGIN;

UPDATE accounts SET balance = balance - 200 WHERE customer_name = 'Alice';
UPDATE accounts SET balance = balance + 200 WHERE customer_name = 'Bob';

-- Verify the changes before committing
SELECT * FROM accounts WHERE customer_name IN ('Alice', 'Bob');

COMMIT;
*/

-- ---------------------------------------------------------
-- Example 2: Intentional Failure and Rollback
-- ---------------------------------------------------------
/*
BEGIN;

-- Try to transfer 800 from Bob to Charlie.
UPDATE accounts SET balance = balance + 800 WHERE customer_name = 'Charlie';
-- The following statement will fail due to the CHECK (balance >= 0) constraint
UPDATE accounts SET balance = balance - 800 WHERE customer_name = 'Bob';

-- Observe the error. The transaction is now in an aborted state.
-- You MUST rollback to clear the aborted state and undo any changes made before the error.
ROLLBACK;

-- Verify balances are unchanged
SELECT * FROM accounts WHERE customer_name IN ('Bob', 'Charlie');
*/

-- ---------------------------------------------------------
-- Example 3: Multi-step Order Processing with Savepoints
-- ---------------------------------------------------------
/*
BEGIN;

-- Step 1: Deduct inventory (Buy 1 Smartphone)
UPDATE products SET stock_quantity = stock_quantity - 1 WHERE product_name = 'Smartphone';

-- Step 2: Create a savepoint
SAVEPOINT order_created;

-- Step 3: Deduct funds from Charlie (Cost: 800)
-- Wait, Charlie only has 150! This will trigger a CHECK constraint error.
UPDATE accounts SET balance = balance - 800 WHERE customer_name = 'Charlie';

-- Step 4: The transaction is aborted! We can rollback to the savepoint instead of losing everything.
ROLLBACK TO SAVEPOINT order_created;

-- Step 5: We could try another payment method, or just cancel. Let's fully rollback since Charlie can't pay.
ROLLBACK;
*/
