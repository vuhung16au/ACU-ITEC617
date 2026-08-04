# Building Stored Procedures for Business Operations

## Overview
A **Stored Procedure** is a prepared SQL code that you can save, so the code can be reused over and over again. If you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

## Key Concepts
- **CREATE PROCEDURE**: The statement used to define a new stored procedure.
- **Parameters (`IN`, `OUT`, `INOUT`)**:
  - `IN` (default): Passes a value into a procedure. The procedure might modify the value, but the modification is not visible to the caller when the procedure returns.
  - `OUT`: Passes a value out of a procedure. Its initial value is ignored, and any changes it undergoes within the procedure are visible to the caller when the procedure returns.
  - `INOUT`: A combination of `IN` and `OUT`.
- **`CALL` statement**: The statement used to execute a stored procedure.
- **Procedural Logic**: Using `IF/ELSE`, loops (`WHILE`), and other control flow structures within the procedure to handle complex business logic.
- **Atomic Operations**: Updating multiple tables within a procedure ensures that either all updates succeed or none do (often paired with transaction management).
