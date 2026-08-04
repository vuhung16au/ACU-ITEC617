-- DDL
CREATE TABLE inventory (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    stock_level INT
);

CREATE TABLE bank_accounts (
    account_id SERIAL PRIMARY KEY,
    owner_name VARCHAR(100),
    balance NUMERIC(10, 2)
);

-- DML
INSERT INTO inventory (item_name, stock_level) VALUES
('Limited Edition Sneakers', 10),
('Concert Tickets', 5);

INSERT INTO bank_accounts (owner_name, balance) VALUES
('Company A', 50000.00),
('Company B', 30000.00);

-- NOTE TO STUDENTS:
-- To practice these scenarios, you must open TWO Query Tools (Session 1 and Session 2)
-- and run the code block by block alternately.

-- ---------------------------------------------------------
-- Scenario 1: Locking Demonstration (Row-level lock)
-- ---------------------------------------------------------
/*
-- Session 1:
BEGIN;
UPDATE inventory SET stock_level = stock_level - 1 WHERE item_name = 'Concert Tickets';
-- Do not commit yet!

-- Session 2:
BEGIN;
-- Try to update the same row. Observe that the query hangs (it is blocked by Session 1's lock).
UPDATE inventory SET stock_level = stock_level - 2 WHERE item_name = 'Concert Tickets';

-- Session 1:
COMMIT; -- Once Session 1 commits, Session 2 will immediately unblock and finish its update.

-- Session 2:
COMMIT;
*/


-- ---------------------------------------------------------
-- Scenario 2: Deadlock
-- ---------------------------------------------------------
/*
-- Session 1:
BEGIN;
UPDATE bank_accounts SET balance = balance + 100 WHERE owner_name = 'Company A';

-- Session 2:
BEGIN;
UPDATE bank_accounts SET balance = balance + 200 WHERE owner_name = 'Company B';

-- Session 1:
-- Now Session 1 tries to update Company B (waiting on Session 2)
UPDATE bank_accounts SET balance = balance - 100 WHERE owner_name = 'Company B';

-- Session 2:
-- Session 2 tries to update Company A (waiting on Session 1)
UPDATE bank_accounts SET balance = balance - 200 WHERE owner_name = 'Company A';
-- ERROR: deadlock detected! PostgreSQL will abort one of the transactions.
*/


-- ---------------------------------------------------------
-- Scenario 3: Lost Update Prevention (Repeatable Read)
-- ---------------------------------------------------------
/*
-- Session 1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT stock_level FROM inventory WHERE item_name = 'Limited Edition Sneakers'; -- Reads 10

-- Session 2:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT stock_level FROM inventory WHERE item_name = 'Limited Edition Sneakers'; -- Reads 10
UPDATE inventory SET stock_level = 9 WHERE item_name = 'Limited Edition Sneakers';
COMMIT;

-- Session 1:
-- Tries to update based on its earlier read.
UPDATE inventory SET stock_level = 9 WHERE item_name = 'Limited Edition Sneakers';
-- ERROR: could not serialize access due to concurrent update.
-- The isolation level successfully prevented a lost update!
ROLLBACK;
*/
