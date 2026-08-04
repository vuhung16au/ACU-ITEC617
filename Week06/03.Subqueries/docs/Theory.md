# Theory: Subqueries (`WHERE`, `IN`, `NOT IN`)

- **Subquery:** A query nested inside another query (such as `SELECT`, `INSERT`, `UPDATE`, or `DELETE`). A subquery can be used anywhere an expression is allowed.
- **WHERE Subqueries:** A subquery used in the `WHERE` clause to filter the results of the outer query based on a dynamic, calculated value (like finding an average first).
- **IN Subqueries:** Used to filter the outer query to rows where a column's value is included in the list of values returned by the inner query.
- **NOT IN Subqueries:** The opposite of `IN`; filters the outer query to rows where the value is *not* found in the results of the inner query. Useful for finding missing relationships (e.g., customers without orders).
- **Best Practice:** When writing nested queries, always test the inner query independently to ensure it returns the correct list of values before wrapping it in the outer query.
