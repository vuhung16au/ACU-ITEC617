# Employee Database Modification Gauntlet

This example provides a pre-populated `Employees` table for practicing SQL DML modifications (`INSERT`, `UPDATE`, `DELETE`) and implementing safe data handling practices.

## Focus Areas
*   **Bulk Inserts:** Adding multiple records efficiently in a single query.
*   **Targeted Updates:** Modifying specific rows based on conditions using `WHERE`.
*   **Deletion Dangers:** Understanding the risks of omitting `WHERE` clauses during updates and deletes.
*   **Soft vs. Hard Deletion:** Altering tables to support soft-deletes (flagging records as inactive) rather than permanently destroying data.
*   **Transactions:** Using `BEGIN`, `COMMIT`, and `ROLLBACK` to safely test changes before making them permanent.
