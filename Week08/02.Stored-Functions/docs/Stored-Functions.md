# Writing Stored Functions for Reusable Calculations

## Overview
A **User-Defined Function (UDF)** in SQL is a database object that encapsulates reusable logic. Unlike stored procedures, functions must return a value and are typically used within `SELECT` statements, `WHERE` clauses, or other SQL expressions.

## Key Concepts
- **`CREATE FUNCTION`**: Defines a new custom function.
- **`RETURNS`**: Specifies the data type of the value that the function will return.
- **Inline Function Usage**: Functions can be embedded directly within `SELECT` statements, allowing for dynamic calculations per row.
- **Data Encapsulation**: Storing business logic (e.g., tax calculation, formatting) directly in the database ensures consistency across different applications that use the database.
- **Difference from Procedures**:
  - Functions *must* return a value (`RETURNS` clause).
  - Functions cannot usually execute transactions (`COMMIT`/`ROLLBACK`).
  - Functions can be used inside SQL queries (`SELECT myFunction(col) FROM table`).
