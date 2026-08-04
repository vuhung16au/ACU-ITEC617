# Week 8 Topic 1: Building Stored Procedures for Business Operations

## Overview
This example demonstrates how to create and execute stored procedures with parameters in PostgreSQL. Stored procedures are crucial for encapsulating complex business logic, ensuring data consistency across multiple operations, and improving performance by reducing network traffic between the application and the database.

## Practice Activities
- Create a procedure `ProcessEmployeePromotion(@EmployeeID, @NewSalary, @NewDepartment)` that updates multiple tables atomically.
- Build a `CalculateMonthlyBonus(@DepartmentName)` procedure that uses IF/ELSE logic to distribute bonuses based on performance metrics.
- Write a procedure to archive old records (e.g., move orders older than 2 years to an archive table).

## Skills Covered
- `CREATE PROCEDURE`
- Parameters (`IN`, `OUT`)
- `CALL` statements
- Procedural logic within SQL (`IF`/`ELSE`, transactions)
