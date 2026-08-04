# Schema Overview

## `Products` Table

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `ProductID` | INT (Primary Key) | Unique identifier for the product. |
| `ProductName` | VARCHAR(100) | Name of the product. |
| `Category` | VARCHAR(50) | Product category. |
| `UnitPrice` | DECIMAL(10, 2) | Standard price per unit. |

## `OrderDetails` Table

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `OrderDetailID` | INT (Primary Key) | Unique identifier for the line item. |
| `OrderID` | INT | Identifier for the order this line item belongs to. |
| `ProductID` | INT (Foreign Key)| Identifier linking to the product. |
| `Quantity` | INT | Number of units purchased in this order. |
| `Discount` | DECIMAL(5, 2) | Any discount applied to this line item (e.g., 0.10 for 10%). |
