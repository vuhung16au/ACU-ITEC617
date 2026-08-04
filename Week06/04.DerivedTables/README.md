# Hands-On Exercise 4: Product Performance Analysis (FROM Subquery)

**Focus:** `FROM` Subqueries (Derived Tables), combining multiple SQL concepts

**Scenario:** You have `Products` and `OrderDetails` tables.

**Tasks:**
- Create a **FROM subquery** that first calculates total quantity sold per product
- Use that result as a virtual table to `JOIN` back to the Products table
- Display: `ProductName`, `Category`, `TotalQuantitySold`, `Revenue` (`UnitPrice` × `TotalQuantitySold`)
- Filter to show only products with **revenue > $10,000**
- Rank results by revenue (descending)

**Learning Outcome:** Master FROM subqueries, understand how to break complex logic into digestible steps, practice testing intermediate results
