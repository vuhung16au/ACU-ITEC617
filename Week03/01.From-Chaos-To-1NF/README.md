# Hands-On Exercise 1: From Chaos to 1NF

**Focus:** Eliminating repeating groups with SQL.

## Scenario
An online bookstore keeps orders in a flat table with comma-separated values for products, quantities, and unit prices. This structure violates the First Normal Form (1NF).

## Tasks
1. Insert 5 sample orders with multiple products (comma-separated) into the flat table.
2. Identify the 1NF violation (repeating groups).
3. Design normalized tables: `Customer`, `Product`, `OrderHeader` (or `Order`), `OrderLine`.
4. Write SQL CREATE statements with proper PRIMARY and FOREIGN KEYs.
5. Write SQL to migrate data from flat table to normalized structure.
6. Write a JOIN query to reconstruct the original flat view.
