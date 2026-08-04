# Employee Database Schema Overview

This example focuses on Data Manipulation Language (DML) modification operations (`INSERT`, `UPDATE`, `DELETE`) and safe practices.

## Tables

### 1. `Employees`
Stores information about employees in an organization.
*   `EmpID`: Primary key.
*   `FirstName`: The employee's first name.
*   `LastName`: The employee's last name.
*   `Department`: The department they work in.
*   `Salary`: Their current annual salary.
*   `HireDate`: The date they were hired.
*   `IsActive`: A boolean flag (added in a later task) for soft deleting records.
