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


**Solution:**

```sql
-- 1. Calculate years of service for each employee
SELECT EmpID, FirstName, LastName, HireDate,
       EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate))::INT AS YearsOfService
FROM Employees;

-- 2. Create a formatted full name column: "LASTNAME, Firstname"
SELECT EmpID,
       CONCAT(UPPER(LastName), ', ', FirstName) AS FullName,
       HireDate, Department, Salary
FROM Employees;

-- 3. Find employees hired in Q1 (January–March) of any year
SELECT EmpID, FirstName, LastName, HireDate, Department
FROM Employees
WHERE EXTRACT(MONTH FROM HireDate) BETWEEN 1 AND 3;

-- 4. Calculate a retention bonus = Salary × 0.05 × Years of Service (rounded to 2 decimals)
SELECT EmpID, FirstName, LastName, HireDate, Salary,
       EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate))::INT AS YearsOfService,
       ROUND(Salary * 0.05 * EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate)), 2) AS RetentionBonus
FROM Employees;

-- 5. Filter to show only employees with 5+ years of service
SELECT EmpID, FirstName, LastName, HireDate, Department, Salary,
       EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate))::INT AS YearsOfService,
       ROUND(Salary * 0.05 * EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate)), 2) AS RetentionBonus
FROM Employees
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, HireDate)) >= 5
ORDER BY YearsOfService DESC;
```

**Learning Outcome:** Master date arithmetic, string manipulation, and numeric functions in real business contexts
