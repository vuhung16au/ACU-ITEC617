# Schema Overview

## Tables

### `employees`
Stores employee information, including contact details and salary.
- `employee_id` (Primary Key)
- `first_name`
- `last_name`
- `phone_number`
- `salary`

### `orders`
Stores customer order information for calculating taxes.
- `order_id` (Primary Key)
- `order_date`
- `customer_name`
- `subtotal`
- `tax_rate`
