# Schema Overview

## Tables

### `accounts`
Stores bank account balances for simulating transfers.
- `account_id` (Primary Key)
- `customer_name`
- `balance`

### `products`
Stores inventory information.
- `product_id` (Primary Key)
- `product_name`
- `stock_quantity`
- `price`

### `orders`
Stores customer orders for the multi-step transaction process.
- `order_id` (Primary Key)
- `account_id` (Foreign Key)
- `product_id` (Foreign Key)
- `quantity`
- `total_price`
