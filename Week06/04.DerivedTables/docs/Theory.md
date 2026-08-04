# Theory: `FROM` Subqueries (Derived Tables)

- **Derived Tables:** A subquery used in the `FROM` clause of a `SELECT` statement is called a derived table or inline view.
- **Why use them?** They allow you to pre-aggregate or pre-filter data before joining it with other tables. This helps to break complex logic into more manageable and digestible steps.
- **Requirement:** Every derived table must be assigned an alias (e.g., `FROM (SELECT ...) AS SubqueryAlias`).
- **Performance & Readability:** Testing the intermediate subquery (the derived table) first ensures your pre-aggregated data is correct before wrapping it into a larger `JOIN` or outer query.
