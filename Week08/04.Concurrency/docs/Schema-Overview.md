# Schema Overview

## Tables

### `inventory`
Stores product inventory levels for simulating concurrent purchases.
- `item_id` (Primary Key)
- `item_name`
- `stock_level`

### `bank_accounts`
Stores account balances for simulating concurrent transfers.
- `account_id` (Primary Key)
- `owner_name`
- `balance`
