# Schema Overview

## `Orders` Table

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `OrderID` | INT (Primary Key) | Unique identifier for the order. |
| `CustomerID` | INT | Identifier for the customer who placed the order. |
| `OrderDate` | DATE | Date the order was placed. |
| `TotalAmount` | DECIMAL(10, 2) | Total monetary value of the order. |
| `Region` | VARCHAR(50) | The region where the order was placed (e.g., North, South, East, West). |
