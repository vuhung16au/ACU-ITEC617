# Stored Procedures & Transaction Safety

## The Problem: Concurrency and Crashes
When transferring money between two accounts, two distinct steps must occur:
1. Deduct funds from the sender.
2. Add funds to the receiver.

If the application crashes, the server loses power, or a network failure happens precisely after Step 1 but before Step 2, the money disappears from the sender's account but never arrives at the receiver's account. This is called a **Partial Failure**.

Additionally, if two transfers involving the same accounts happen at the exact same millisecond, they might read the same original balance and overwrite each other. This is known as a **Lost Update**, a type of concurrency anomaly.

## The Solution: ACID Transactions
Database engines solve this using **Transactions**. A transaction groups multiple operations into a single, indivisible unit of work (Atomicity).

*   `BEGIN`: Starts the transaction block.
*   `COMMIT`: Applies all changes permanently to disk. If the transaction reaches this point, it is guaranteed to be saved (Durability).
*   `ROLLBACK`: If an error occurs at any point before the commit, a rollback undoes all operations back to the state they were in before the `BEGIN` command.

## Stored Procedures
Instead of managing the `BEGIN`, `COMMIT`, and `ROLLBACK` commands inside the application code (which requires multiple slow network round-trips to the database), we can bundle the logic into a **Stored Procedure**. 

A Stored Procedure executes entirely within the database engine. It inherently runs within a transaction context, making it faster and significantly safer for critical operations like financial transfers.
