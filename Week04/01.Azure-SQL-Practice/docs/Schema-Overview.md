# Schema Overview

The `CUSTOMERS` and `ORDERS` tables are used in this topic to practice creating tables across different database engines and performing data manipulation and querying. Additionally, `sales` and `products` tables are used for performance testing.

## Tables

### `customers`
Stores customer information.
- `id` (Primary Key)
- `name`
- `registration_date`

### `orders`
Stores order details.
- `id` (Primary Key)
- `customer_id` (Foreign Key)
- `region`
- `amount`

### `products`
Stores product details.
- `id` (Primary Key)
- `product_name`

### `sales`
Stores sales transactions.
- `id` (Primary Key)
- `product_id` (Foreign Key)
- `quantity`
- `sale_date`
