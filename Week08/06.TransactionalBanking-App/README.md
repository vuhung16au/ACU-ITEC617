# Week 8, Topic 6: Stored Procedures & Transaction Safety

## Overview
This topic explores the core mechanisms of **Transactions** and **Stored Procedures** through a relatable, terminal-based banking simulator. 

Students will witness firsthand what happens when database queries fail mid-execution without transaction controls—resulting in missing money and corrupted data (partial failures). Then, they will see how wrapping queries in `BEGIN`, `COMMIT`, and `ROLLBACK` commands strictly enforces Atomicity (all-or-nothing execution).

Finally, the example demonstrates offloading this transaction logic directly to the database engine using a **Stored Procedure**.

## Why this helps
It reinforces the abstract ACID transaction properties (Atomicity, Consistency, Isolation, Durability) by forcing students to interact with a broken system and then showing them how transactions natively protect financial data integrity.

## Structure
* `init-scripts/01-init.sql`: Sets up the Alice and Bob bank accounts and defines the `transfer_funds` stored procedure.
* `banking_app.py`: A Python terminal application that connects to the database to demonstrate unsafe and safe concurrency.
* `docs/`: Theoretical overviews on Stored Procedures and Transaction Isolation Levels.
* `docker-compose.yaml`: The PostgreSQL and pgAdmin environment.

Read the `QUICKSTART.md` for instructions on running the app and the database.
