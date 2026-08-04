# Hands-On Exercise 4: Normalisation vs Performance (Real-World Decision)

**Focus:** When to denormalize - practical performance testing.

## Scenario
An e-commerce analytics dashboard needs customer summaries. Querying the live transactional tables (normalized) is proving to be too slow because of massive JOINs and aggregations. 

## Tasks
1. Connect to the database where both the Normalized (3NF) and Denormalized schemas are created.
2. The database is pre-populated with 1,000 customers, 5,000 orders, and ~20,000 order lines.
3. Write a complex JOIN query on the normalized tables to get a customer summary (Total Orders, Total Revenue, Last Order Date per Customer).
4. Populate the denormalized `CustomerSummary` table using your JOIN query.
5. Use `EXPLAIN ANALYZE` to compare:
   - Query execution time on the normalized tables.
   - Query execution time on the `CustomerSummary` table.
   - Rows examined in both approaches.
6. Write a stored procedure or trigger to keep `CustomerSummary` in sync when new orders are placed.
7. Document your decision: When would you use each approach?

**Deliverable:** Performance comparison report with SQL scripts.
