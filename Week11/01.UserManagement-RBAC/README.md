# Week 11 - 01. SQL User Management and RBAC Implementation

## Overview
This example demonstrates how to implement **Role-Based Access Control (RBAC)** in a relational database. Managing users and defining fine-grained permissions ensures the **Principle of Least Privilege**, where individuals only have access to the data they need to perform their job functions.

## Focus
*   Creating users and roles with SQL (`CREATE USER`, `CREATE ROLE`).
*   Creating custom roles for different job functions (e.g., `DataAnalyst`, `DataEntry`, `SecurityAuditor`).
*   Assigning permissions using `GRANT` and `REVOKE` statements.
*   Testing the **Principle of Least Privilege** by connecting as different users and attempting various operations.
*   Querying system catalogs to view current permissions (e.g., `information_schema.role_table_grants`, `pg_roles`).

*Note: While the initial request referenced T-SQL specific syntax (like `CREATE LOGIN`, `DENY`, and `sys.database_permissions`), this environment uses PostgreSQL as the standard lab database. The concepts map directly to PostgreSQL's robust RBAC system.*

## Directory Structure
*   `docs/`: Contains theoretical documentation on the schema and PostgreSQL RBAC concepts.
*   `init-scripts/`: SQL scripts that automatically create the schema (`company.departments`, `company.employees`, `company.financial_records`) and insert sample data when the container starts.
*   `docker-compose.yaml`: Docker configuration for spinning up the PostgreSQL database and pgAdmin.

## Next Steps
Follow the instructions in the [QUICKSTART.md](QUICKSTART.md) file to start the environment and perform the exercises.
