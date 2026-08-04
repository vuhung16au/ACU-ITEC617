# Hands-On Exercise 2: Employee Tenure and Date Function Practice

**Focus:** SQL Date Functions (`DATEDIFF`, `YEAR`, `MONTH`), String Functions (`CONCAT`, `UPPER`), and Computed Columns

**Scenario:** You have an `Employees` table.

**Tasks:**
- Calculate **years of service** for each employee (current date - HireDate)
- Create a **formatted full name** column: "LASTNAME, Firstname" (e.g., "SMITH, John")
- Find employees hired in **Q1 (January-March)** of any year
- Calculate a **retention bonus** = Salary × 0.05 × Years of Service (rounded to 2 decimals)
- Filter to show only employees with **5+ years of service**

*(Note: While the prompt mentions T-SQL functions like `DATEDIFF`, `YEAR`, and `MONTH`, consider the PostgreSQL equivalents like `EXTRACT`, `AGE`, or simple date arithmetic since we are using Postgres.)*

**Learning Outcome:** Master date arithmetic, string manipulation, and numeric functions in real business contexts
