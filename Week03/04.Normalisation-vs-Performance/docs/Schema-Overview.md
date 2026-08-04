# Schema Overview: Normalisation vs Performance

This exercise explores the trade-offs between a highly normalized database (3NF) and a denormalized schema optimized for read performance.

## Part A: Normalized Schema (3NF)
This represents a traditional OLTP (Online Transaction Processing) design.
*   **Customer**
    *   `CustomerID` (INT, PK)
    *   `Name` (VARCHAR)
    *   `Email` (VARCHAR)
*   **OrderHeader** (Named `OrderHeader` to avoid the `ORDER` reserved keyword)
    *   `OrderID` (INT, PK)
    *   `CustomerID` (INT, FK)
    *   `OrderDate` (DATE)
    *   `Status` (VARCHAR)
*   **OrderLine**
    *   `OrderID` (INT, FK)
    *   `ProductID` (INT)
    *   `Quantity` (INT)
    *   `UnitPrice` (DECIMAL(10,2))
    *   *(PK is OrderID, ProductID)*

## Part B: Denormalized Schema
This represents a read-optimized schema (similar to a Materialized View or OLAP dimension) designed to avoid expensive JOINs.
*   **CustomerSummary**
    *   `CustomerID` (INT, PK)
    *   `Name` (VARCHAR)
    *   `TotalOrders` (INT)
    *   `TotalRevenue` (DECIMAL(10,2))
    *   `LastOrderDate` (DATE)
