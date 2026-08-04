# Solving Anomalies with Primary and Foreign Keys

To solve the problems of flat files, Relational Database Management Systems (RDBMS) allow us to split our data into separate, specialized tables. This process is called **Normalization**.

## Primary Keys (PK)
A Primary Key is a unique identifier for a row in a table. 
*   In a `customers` table, `customer_id` is the Primary Key. No two customers can have the same ID.
*   This ensures we can uniquely identify every record.

## Foreign Keys (FK)
A Foreign Key is a column in one table that links to the Primary Key of another table.
*   In our `orders` table, we add a `customer_id` column. This is the Foreign Key.
*   Instead of writing "Alice Smith, 123 Apple St" on every order, we just write `customer_id = 1`.

## How this solves anomalies:
1.  **Update Anomaly solved:** If Alice moves, we update her address *once* in the `customers` table. All her orders in the `orders` table automatically point to the updated information.
2.  **Delete Anomaly solved:** If we delete Alice's orders, her information remains safe in the `customers` table.
3.  **Insertion Anomaly solved:** We can add new customers to the `customers` table even if they have no orders in the `orders` table.
