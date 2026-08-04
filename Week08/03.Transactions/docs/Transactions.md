# Transaction Management

## Overview
A **Transaction** in SQL is a sequence of operations performed as a single logical unit of work. A transaction ensures that database operations are processed reliably and consistently, even in cases of system failure or errors.

Transactions guarantee the **ACID** properties:
- **Atomicity**: "All or nothing." Either all statements in the transaction complete successfully, or none of them do.
- **Consistency**: The database must transition from one valid state to another.
- **Isolation**: Concurrent transactions do not interfere with each other.
- **Durability**: Once a transaction is committed, it remains committed even in the event of a system failure.

## Key Concepts
- **`BEGIN` / `START TRANSACTION`**: Marks the beginning of a transaction.
- **`COMMIT`**: Saves all changes made during the current transaction permanently.
- **`ROLLBACK`**: Undoes all changes made during the current transaction.
- **`SAVEPOINT`**: A point within a transaction to which you can later roll back, without rolling back the entire transaction.
- **`ROLLBACK TO SAVEPOINT`**: Rolls back the transaction to the specified savepoint.
