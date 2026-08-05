# Week 6, Topic 6: Query Optimisation & Index Auditing

## Overview
This example is an SQL performance-tuning playground. It comes loaded with a large database consisting of 100,000 customers and 500,000 orders. 

Students will execute purposefully slow queries (including unindexed joins and wildcards) and utilize the database engine's **EXPLAIN PLAN** feature to identify performance bottlenecks (like Sequential Scans). Then, they will incrementally optimize the queries by adding Functional Indexes and Covering Indexes, and observe how the query execution engine switches to blazing-fast Index Only Scans.

## Why this helps
Writing SQL that returns the correct results is only the first step. This lab teaches students the real-world computational cost of unindexed queries on large datasets, bridging the gap between basic SQL logic and enterprise-level database performance tuning.

## Structure
* `init-scripts/01-init.sql`: Creates the schema and auto-generates hundreds of thousands of mock records.
* `init-scripts/02-queries.sql`: Contains the slow queries and the step-by-step optimization script.
* `docs/`: Theoretical explanation of functional vs covering indexes and how to read the EXPLAIN PLAN.
* `docker-compose.yaml`: The PostgreSQL and pgAdmin environment.

Read the `QUICKSTART.md` for instructions on running the environment.
