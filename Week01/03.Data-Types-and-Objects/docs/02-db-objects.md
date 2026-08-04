# Key Database Objects

Beyond tables, relational databases use several other objects to manage data, optimize performance, and simplify application logic.

## 1. Views
A View is a virtual table based on the result-set of an SQL statement.
*   **Purpose:** Simplifies complex queries, restricts access to certain rows/columns for security.
*   **Example:** The `high_earners` view allows users to see who makes over $70,000 without having to write the `WHERE` clause every time.

## 2. Indexes
An Index is a special data structure that improves the speed of data retrieval operations on a database table.
*   **Purpose:** Think of it like an index in a book. Instead of reading every page (a "full table scan") to find a topic, the database jumps straight to the right location.
*   **Example:** `idx_emp_department` speeds up queries that search for employees by department.

## 3. Stored Procedures (and Functions)
A Stored Procedure is a prepared SQL code that you can save, so the code can be reused over and over again. PostgreSQL typically uses "Functions" for this.
*   **Purpose:** Encapsulates business logic inside the database. Reduces network traffic (you just call the function instead of sending multiple SQL statements).
*   **Example:** The `give_raise` function handles the update logic securely on the server.
