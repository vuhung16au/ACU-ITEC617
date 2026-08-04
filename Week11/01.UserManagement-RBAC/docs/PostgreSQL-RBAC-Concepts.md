# PostgreSQL RBAC Concepts vs. T-SQL

While the core concepts of Role-Based Access Control (RBAC) and the Principle of Least Privilege are universal across modern relational databases, the specific syntax and implementation details can vary.

This document maps the concepts requested (often associated with Microsoft SQL Server / T-SQL) to their PostgreSQL equivalents used in this lab.

## Users vs. Roles

*   **T-SQL**: Separates server-level authentication (`CREATE LOGIN`) from database-level access (`CREATE USER`).
*   **PostgreSQL**: Simplifies this by treating everything as a **Role**. A "User" in PostgreSQL is simply a Role that has the `LOGIN` privilege.
    *   `CREATE ROLE DataAnalyst;` (Creates a group-level role without login capabilities).
    *   `CREATE USER alice WITH PASSWORD 'password';` (Creates a role with login capabilities. It is an alias for `CREATE ROLE alice LOGIN PASSWORD 'password';`).

## Permissions: GRANT and REVOKE

*   **T-SQL**: Uses `GRANT`, `REVOKE`, and `DENY`. `DENY` explicitly overrides any `GRANT` permissions inherited from other roles.
*   **PostgreSQL**: Uses `GRANT` and `REVOKE`. It does **not** have a `DENY` statement. In PostgreSQL, permissions are additive. If you don't have a privilege granted to you or any role you inherit from, you are denied by default. You use `REVOKE` to remove a previously granted privilege.

## System Catalogs (Views)

To audit security, you query the database's internal system tables/views.

*   **T-SQL**: Uses views like `sys.database_permissions` and `sys.server_principals`.
*   **PostgreSQL**: Uses the ANSI standard `information_schema` and its own `pg_catalog`.
    *   To see server principals (roles): `SELECT * FROM pg_roles;`
    *   To see table-level permissions: `SELECT * FROM information_schema.role_table_grants;`
