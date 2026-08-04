# Hands-On Exercise 3: Finding High-Value Customers with Subqueries

**Focus:** `WHERE` Subqueries and `IN` Subqueries

**Scenario:** You have two tables: `Customers` and `Orders`.

**Tasks:**
- Find customers whose **total spending is above the company average** (use subquery to calculate avg first)
- List customer names who placed orders **in the last 30 days** (use `IN` subquery)
- Find the **top spender** by writing a query that finds the customer with MAX(total spending)
- Identify customers who have **never placed an order** (use `NOT IN` subquery)

**Learning Outcome:** Practice nested query logic, test inner queries independently before wrapping outer queries
