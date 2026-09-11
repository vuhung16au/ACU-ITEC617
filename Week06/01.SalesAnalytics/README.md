# Hands-On Exercise 1: Sales Department Analytics Dashboard

**Focus:** `GROUP BY`, `HAVING`, and Aggregate Functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)

**Scenario:** You work for an e-commerce company with an `Orders` table.

**Tasks:**
- Write a query to calculate **total revenue** and **number of orders** per region
- Find regions where the **average order value exceeds $500**
- Identify the **top 3 regions** by total revenue
- Show only regions with **at least 10 orders** using `HAVING`

**Solution:**

```sql
-- 1. Total revenue and number of orders per region
SELECT
    Region,
    COUNT(*)          AS total_orders,
    SUM(TotalAmount)  AS total_revenue
FROM Orders
GROUP BY Region
ORDER BY total_revenue DESC;

-- 2. Regions where the average order value exceeds $500
SELECT
    Region,
    AVG(TotalAmount)  AS avg_order_value
FROM Orders
GROUP BY Region
HAVING AVG(TotalAmount) > 500
ORDER BY avg_order_value DESC;

-- 3. Top 3 regions by total revenue
SELECT
    Region,
    SUM(TotalAmount)  AS total_revenue
FROM Orders
GROUP BY Region
ORDER BY total_revenue DESC
LIMIT 3;

-- 4. Regions with at least 10 orders
SELECT
    Region,
    COUNT(*)          AS total_orders,
    SUM(TotalAmount)  AS total_revenue
FROM Orders
GROUP BY Region
HAVING COUNT(*) >= 10
ORDER BY total_orders DESC;
```

**Learning Outcome:** Master GROUP BY with multiple aggregates and filter summary data with HAVING
