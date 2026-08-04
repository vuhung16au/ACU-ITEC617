# Schema Overview

The database `companydb` contains the following tables:

## Tables

### `departments`
Stores department information.
- `dept_id` (Primary Key, Auto Increment)
- `dept_name` (String, Not Null)
- `location` (String)

### `employees`
Stores employee information.
- `emp_id` (Primary Key, Auto Increment)
- `first_name` (String, Not Null)
- `last_name` (String, Not Null)
- `dept_id` (Foreign Key referencing `departments`)
- `hire_date` (Date)
- `salary` (Decimal)
