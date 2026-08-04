# Schema Overview

## Tables

### `employees`
Stores employee information.
- `employee_id` (Primary Key)
- `first_name`
- `last_name`
- `department`
- `salary`
- `hire_date`

### `orders`
Stores order information.
- `order_id` (Primary Key)
- `order_date`
- `customer_id`
- `total_amount`

### `orders_archive`
Stores archived order information (orders older than 2 years).
- `order_id` (Primary Key)
- `order_date`
- `customer_id`
- `total_amount`
- `archived_at`

### `promotion_history`
Tracks employee promotions and department changes.
- `promotion_id` (Primary Key)
- `employee_id` (Foreign Key)
- `old_salary`
- `new_salary`
- `old_department`
- `new_department`
- `promotion_date`
