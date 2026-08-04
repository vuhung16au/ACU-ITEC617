# Concurrency Control

## Overview
**Concurrency** occurs when multiple transactions execute simultaneously. While this is necessary for performance in a multi-user environment, it can lead to various data consistency issues if not managed properly. **Concurrency Control** ensures that simultaneous transactions do not interfere with each other and that the database remains consistent.

## Common Concurrency Issues
- **Lost Update**: Two transactions read the same data, modify it, and commit. The second transaction overwrites the first transaction's changes, "losing" the first update.
- **Dirty Read**: A transaction reads data that has been modified by another transaction that has not yet committed. If the other transaction rolls back, the first transaction has read invalid data.
- **Non-Repeatable Read**: A transaction reads the same row twice and gets different data each time because another transaction modified and committed the row in between the reads.
- **Phantom Read**: A transaction executes a query returning a set of rows. Another transaction inserts or deletes rows matching the query criteria and commits. The first transaction re-runs the query and gets a different set of rows.

## Isolation Levels
SQL defines four standard isolation levels to manage these issues. Each level provides a different trade-off between consistency and performance:
1. **READ UNCOMMITTED**: Lowest level. Allows dirty reads. (Note: PostgreSQL treats this identically to READ COMMITTED).
2. **READ COMMITTED**: Default in PostgreSQL. Prevents dirty reads.
3. **REPEATABLE READ**: Prevents dirty reads and non-repeatable reads.
4. **SERIALIZABLE**: Highest level. Prevents all concurrency issues by ensuring transactions execute as if they were serialized (one after another).

## Locking
Databases use locks to enforce isolation.
- **Row-level locks**: Block other transactions from modifying a specific row.
- **Table-level locks**: Block other transactions from modifying an entire table.
- **Deadlock**: Occurs when two or more transactions are waiting for each other to release locks, causing an infinite wait. The database usually detects this and aborts one of the transactions.
