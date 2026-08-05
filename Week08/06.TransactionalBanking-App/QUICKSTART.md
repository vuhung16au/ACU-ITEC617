# Quickstart Guide

This tutorial provides a PostgreSQL database and a Python terminal application that interact with each other to demonstrate transaction safety.

## Part 1: Start the Database

1. Open your terminal and navigate to this directory (`Week08/06.TransactionalBanking-App/`).
2. Start the Docker environment:
   ```bash
   make up
   ```
3. (Optional) You can open pgAdmin at http://localhost:5050 (Password: `password`) to view the `Accounts` table and the `transfer_funds` stored procedure manually.

## Part 2: Run the Simulator

1. Ensure you have Python installed. You must install the PostgreSQL Python adapter (`psycopg2-binary`).
   ```bash
   pip install -r requirements.txt
   ```
2. Run the interactive banking simulator:
   ```bash
   python3 banking_app.py
   ```
3. Follow the on-screen prompts:
   * **Test 1 (Unsafe):** Watch Alice lose $100 without Bob ever receiving it due to a simulated crash.
   * **Test 2 (Safe Transaction):** Watch the same crash happen, but witness the database `ROLLBACK` the transaction, restoring Alice's money.
   * **Test 3 (Stored Procedure):** Run a successful transfer that is fully managed by the database engine.

## Cleanup
When finished, stop the database:
```bash
make down
```
