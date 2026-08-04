# Schema Overview

The database contains the following tables:

## Tables

### `departments`
Stores department information.
- `id` (UUID, Primary Key)
- `name` (String, Not Null, Unique)
- `location` (String)
- `budget` (Decimal)
- `created_at` (Timestamp)

### `employees`
Stores employee information.
- `id` (UUID, Primary Key)
- `first_name` (String, Not Null)
- `last_name` (String, Not Null)
- `email` (String, Unique, Not Null)
- `department_id` (UUID, Foreign Key)
- `hire_date` (Date, Not Null)
- `salary` (Decimal, Not Null)
- `is_active` (Boolean)
- `created_at` (Timestamp)

### `projects`
Stores project information.
- `id` (UUID, Primary Key)
- `name` (String, Not Null)
- `department_id` (UUID, Foreign Key)
- `start_date` (Date)
- `end_date` (Date)
- `status` (String)
- `created_at` (Timestamp)

### `employee_projects`
Join table mapping employees to projects.
- `employee_id` (UUID, Primary Key, Foreign Key)
- `project_id` (UUID, Primary Key, Foreign Key)
- `role` (String, Not Null)
- `hours_allocated` (Integer)
