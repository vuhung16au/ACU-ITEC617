# Bonus Challenge: Correlated Subqueries and Performance

**Focus:** Correlated Subqueries, Performance tuning, and `JOIN`s

**Scenario:** You have a `Products` table.

**Tasks:**
- Write a query using a **correlated subquery** to find products whose price is higher than the average price *within their own category*.
- Consider why this query might be slow on a table with millions of rows.
- Rewrite the query using a **JOIN** (specifically, joining to a derived table) instead of a correlated subquery to achieve the same result more efficiently.

**Learning Outcome:** Understand the performance implications of correlated subqueries and learn how to optimize them using standard JOIN patterns.
