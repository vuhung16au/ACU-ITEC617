# Week 8 Topic 3: Transaction Management: Bank Transfer Simulation

## Overview
This example focuses on transaction management using `START TRANSACTION` (or `BEGIN`), `COMMIT`, and `ROLLBACK`. The primary example is a bank transfer simulation, demonstrating the core principle of **Atomicity** — ensuring that either both sides of the transfer succeed, or both fail.

## Practice Activities
- **Bank Transfer**: Simulate a transfer by deducting funds from Account A and adding them to Account B.
- **Intentional Failure**: Trigger an error mid-transaction (e.g., simulating insufficient funds) and use `ROLLBACK` to undo changes.
- **Multi-step Order Processing**: Combine inventory updates, order creation, and customer credit deduction in a single transaction with proper error handling.
- **Savepoints**: Practice creating partial rollbacks using `SAVEPOINT sp1` and `ROLLBACK TO sp1`.

## Skills Covered
- `BEGIN` / `START TRANSACTION`
- `COMMIT`
- `ROLLBACK`
- Savepoints (`SAVEPOINT`)
- Understanding ACID properties (especially Atomicity)
