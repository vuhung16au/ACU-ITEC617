# Quickstart Guide

This tutorial provides a PostgreSQL environment pre-loaded with hundreds of thousands of records to simulate a real-world database load for query optimization.

## Running the Database

1. Open your terminal and navigate to this directory (`Week06/06.QueryOptimisation/`).
2. Start the Docker environment:
   ```bash
   make up
   ```
   *Note: It may take a minute or two for the database to finish generating the 600,000 mock records on startup.*
3. Open your web browser and navigate to http://localhost:5050.
4. On the left side, under **Servers**, expand **ITEC617 - Week 06 DB**.
5. When prompted for a password, enter `password`.
6. Open **Tools → Query Tool**.

## Running the Playground

1. Open the file `init-scripts/02-queries.sql` in your IDE or text editor.
2. Copy the first slow query into your pgAdmin Query Tool.
3. Above the query window, click the **Explain** (or **Explain Analyze**) button (the icon usually looks like a hand pointing or a flowchart), or just prepend `EXPLAIN ANALYZE` to your query and hit the standard **Execute/Play** button.
4. Read the output. Look for red blocks or lines that say **Seq Scan**. This indicates a Sequential Scan (full table scan), which is slow.
5. Follow the steps in `02-queries.sql` one-by-one: create the recommended indexes and re-run the queries, observing how the EXPLAIN plan changes to **Index Scan** or **Index Only Scan**.

## Cleanup
When finished, bring the environment down:
```bash
make down
```
