# Schema Overview

This lab uses a simple `company` schema to demonstrate Role-Based Access Control. It contains tables with varying levels of sensitivity to illustrate why granular permissions are necessary.

## Tables

### 1. `company.departments`
Stores information about the departments within the company.
- **`department_id`** (INT, Primary Key): Unique identifier for the department.
- **`department_name`** (VARCHAR): Name of the department.

### 2. `company.employees`
Stores employee records, including job titles and salaries. Salary information is typically considered sensitive.
- **`employee_id`** (INT, Primary Key): Unique identifier for the employee.
- **`first_name`** (VARCHAR): Employee's first name.
- **`last_name`** (VARCHAR): Employee's last name.
- **`department_id`** (INT, Foreign Key): References `departments.department_id`.
- **`job_title`** (VARCHAR): The employee's role in the company.
- **`salary`** (DECIMAL): The employee's annual salary.

### 3. `company.financial_records`
Stores highly sensitive company financial data.
- **`record_id`** (INT, Primary Key): Unique identifier for the record.
- **`description`** (VARCHAR): Description of the financial event.
- **`amount`** (DECIMAL): The monetary value.
- **`record_date`** (DATE): When the transaction occurred.

## RBAC Scenario
In a real-world application of this schema:
*   A **Data Analyst** might need `SELECT` access to `departments` and `employees` for reporting, but perhaps shouldn't see `financial_records`.
*   A **Human Resources Manager** might need `INSERT`, `UPDATE`, and `DELETE` access to `employees`.
*   A **Financial Auditor** might need `SELECT` access to all tables, including `financial_records`.
