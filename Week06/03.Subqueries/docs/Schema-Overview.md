# Schema Overview

## `Customers` Table

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `CustomerID` | INT (Primary Key) | Unique identifier for the customer. |
| `CustomerName` | VARCHAR(100) | The full name of the customer. |
| `City` | VARCHAR(50) | The city where the customer is located. |

## `Orders` Table

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `OrderID` | INT (Primary Key) | Unique identifier for the order. |
| `CustomerID` | INT (Foreign Key)| Identifier linking to the customer who placed the order. |
| `OrderDate` | DATE | Date the order was placed. |
| `TotalAmount` | DECIMAL(10, 2) | Total monetary value of the order. |
