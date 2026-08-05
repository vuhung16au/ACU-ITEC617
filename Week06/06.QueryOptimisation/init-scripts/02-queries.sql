-- Query Optimisation Playground

-- 1. THE SLOW QUERY (Unindexed Wildcard and Join)
-- Run this query and view the EXPLAIN PLAN.
-- Notice the "Seq Scan" (Sequential Scan) on the Customers and Orders tables.
EXPLAIN ANALYZE
SELECT c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Email LIKE '%user99999%';

-- 2. ADDING A FUNCTIONAL INDEX
-- The query above was slow because leading wildcards ('%...') prevent standard B-Tree indexes from working.
-- If we frequently search by case-insensitive exact matches instead, we can use a functional index.
CREATE INDEX idx_customers_email_lower ON Customers(LOWER(Email));

-- Now, change the query to use an exact match on the functional index:
EXPLAIN ANALYZE
SELECT c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE LOWER(c.Email) = 'user99999@example.com';
-- Notice the "Index Scan" on idx_customers_email_lower.

-- 3. ADDING A COVERING INDEX
-- Even with the index on Email, the database still has to fetch the FirstName and LastName from the table.
-- We can "cover" the query by including those columns in the index.
DROP INDEX idx_customers_email_lower;
CREATE INDEX idx_customers_email_covering ON Customers(LOWER(Email)) INCLUDE (FirstName, LastName);

-- 4. ADDING AN INDEX FOR THE JOIN
-- The join to Orders is still doing a Sequential Scan because there's no index on Order(CustomerID).
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);

-- 5. THE FULLY OPTIMISED QUERY
-- Run the exact match query again. 
-- It should now use an Index Only Scan on Customers, and an Index Scan on Orders!
EXPLAIN ANALYZE
SELECT c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE LOWER(c.Email) = 'user99999@example.com';
