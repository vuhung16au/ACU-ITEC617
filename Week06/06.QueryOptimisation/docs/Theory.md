# Query Optimisation & Index Auditing

Writing SQL that produces the correct result is only half the battle. When dealing with thousands or millions of records, an inefficient query can bring a database to a halt.

## The Cost of Sequential Scans
A Sequential Scan (or Table Scan) occurs when the database engine reads every single row in a table to find matching records. This happens when:
*   There is no index on the columns used in the `WHERE` or `JOIN` clauses.
*   Functions or operations are applied to the column in the `WHERE` clause (e.g., `LOWER(Email) = ...`), and no functional index exists.
*   A leading wildcard is used in a `LIKE` clause (e.g., `LIKE '%Name%'`), rendering standard B-Tree indexes useless.

## Functional Indexes
If you frequently query data using a specific function (like making text lowercase for case-insensitive searches), you can create an index on the *result* of that function.
```sql
CREATE INDEX idx_lower_email ON Customers(LOWER(Email));
```
With this functional index, the database can rapidly search `WHERE LOWER(Email) = 'test@example.com'` without performing the `LOWER` function on every single row during the query.

## Covering Indexes
Normally, an index points to the location of the full row on disk. If a query only needs a few columns, you can add them to the index using the `INCLUDE` keyword. 
```sql
CREATE INDEX idx_email_covering ON Customers(LOWER(Email)) INCLUDE (FirstName, LastName);
```
The database can then fulfill the query entirely from the index (an "Index Only Scan"), skipping the expensive lookup back to the main table on disk.

## The EXPLAIN PLAN
The `EXPLAIN` (or `EXPLAIN ANALYZE` in PostgreSQL) command is your primary tool for auditing queries. It reveals the execution path the database engine has chosen, showing you exactly where the bottlenecks (like Sequential Scans) are occurring.

In pgAdmin, you can also use the visual "Explain" tool in the query builder to see a node-graph flowchart of where the query spends most of its time. Red nodes usually represent slow operations like sequential scans or disk sorts.
