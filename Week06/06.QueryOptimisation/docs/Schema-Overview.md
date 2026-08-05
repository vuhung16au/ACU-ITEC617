# Schema Overview

This lab uses an intentionally simple schema that is loaded with massive amounts of mock data to demonstrate the impact of indexing.

## Customers
Contains 100,000 auto-generated records.
* **`CustomerID` (PK)**: Auto-incrementing integer.
* **`FirstName`**: VARCHAR(50). Example: "First241"
* **`LastName`**: VARCHAR(50). Example: "Last241"
* **`Email`**: VARCHAR(100). Example: "user241@example.com"
* **`RegistrationDate`**: DATE.

## Orders
Contains 500,000 auto-generated records.
* **`OrderID` (PK)**: Auto-incrementing integer.
* **`CustomerID` (FK)**: Foreign key referencing `Customers`. Note: When the database is created, there is *no index* on this foreign key column by default, which makes JOINs exceptionally slow at this scale until an index is added.
* **`OrderDate`**: DATE.
* **`TotalAmount`**: DECIMAL(10,2).
