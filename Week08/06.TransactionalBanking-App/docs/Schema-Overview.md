# Schema Overview

## Accounts Table
A simple table to hold banking ledgers.
* **`AccountID` (PK)**: Auto-incrementing identifier.
* **`AccountName`**: The owner of the account (e.g., Alice, Bob).
* **`Balance`**: A numeric column with two decimal places. It is protected by a `CHECK (Balance >= 0)` constraint, enforcing basic data consistency by rejecting any transaction that results in a negative balance.

## Stored Procedure: `transfer_funds`
This procedural code is stored directly within the PostgreSQL database.
* **Parameters**: `sender_id`, `receiver_id`, `transfer_amount`.
* **Logic**: 
  1. Checks if the sender has sufficient funds. If not, it intentionally raises an exception to abort the transaction.
  2. Executes the deduction from the sender.
  3. Executes the addition to the receiver.
* **Execution**: It is called using `CALL transfer_funds(1, 2, 100);`. Because it is executed inside the DB engine, it ensures the entire block succeeds or fails as a single atomic unit.
