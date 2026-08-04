# Week 8 Topic 2: Writing Stored Functions for Reusable Calculations

## Overview
This example demonstrates how to create user-defined functions that return values in PostgreSQL. Functions are useful for encapsulating reusable calculations or data formatting rules, and they can be called directly within your standard `SELECT` queries.

## Practice Activities
- Create a function `CalculateTax(Amount, TaxRate)` that returns the tax amount and use it in `SELECT` statements.
- Build a `FormatPhoneNumber(RawNumber)` function that formats phone numbers consistently (e.g., `0412345678` → `(04) 1234 5678`).
- Write a function `GetEmployeeGrade(EmployeeID)` that returns 'A', 'B', or 'C' based on the salary range, then use it in queries.

## Skills Covered
- `CREATE FUNCTION`
- `RETURNS` clause
- Inline function usage in `SELECT` statements
- Combining built-in and custom functions
