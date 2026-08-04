# Theory: Correlated Subqueries vs. JOINs

- **Correlated Subquery:** A subquery that uses values from the outer query. Because it depends on the outer query, it must be executed once for *every single row* processed by the outer query. This can lead to poor performance on large datasets.
- **JOIN / Derived Tables:** Often, correlated subqueries can be rewritten by calculating the aggregate values once in a derived table (a `FROM` subquery) and then `JOIN`ing those results back to the main table. This is generally much faster because the database calculates the aggregates for all groups in a single pass.
- **Window Functions (Advanced):** Another modern and highly efficient way to solve this type of problem in PostgreSQL is using Window Functions like `AVG(Price) OVER(PARTITION BY Category)`.
