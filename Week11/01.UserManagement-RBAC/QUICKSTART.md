# Quickstart Guide

This guide will help you start the PostgreSQL database and pgAdmin environment for the RBAC and User Management lab.

## 1. Start the Environment

Open your terminal, navigate to this folder (`Week11/01.UserManagement-RBAC`), and run:

```bash
make up
```

This command uses Docker Compose to start two containers:
- A PostgreSQL database (pre-loaded with a `company` schema and data).
- A pgAdmin web interface.

## 2. Access pgAdmin

1. Open your web browser and go to [http://localhost:5050](http://localhost:5050).
2. You will **not** need to log in to the pgAdmin web interface (it is configured for single-user desktop mode).
3. On the left sidebar, expand **Servers**.
4. Click on **ITEC617 - Week 11 DB**.
5. When prompted for a password, enter: `password`

## 3. Exercises

Open the **Query Tool** (Tools -> Query Tool) and complete the following activities:

### Exercise 1: Create Roles and Users
Create roles for different job functions and assign users to them.

```sql
-- Create a read-only role for Data Analysts
CREATE ROLE DataAnalyst;

-- Create an administrative role for Data Entry
CREATE ROLE DataEntry;

-- Create users with login access
CREATE USER alice_analyst WITH PASSWORD 'secret123';
CREATE USER bob_entry WITH PASSWORD 'secret123';

-- Assign users to roles
GRANT DataAnalyst TO alice_analyst;
GRANT DataEntry TO bob_entry;
```

### Exercise 2: Assign Granular Permissions
Use `GRANT` and `REVOKE` to implement the Principle of Least Privilege. By default, new roles cannot access schemas created by others.

```sql
-- Grant usage on the schema to both roles
GRANT USAGE ON SCHEMA company TO DataAnalyst, DataEntry;

-- Data Analyst: Can only SELECT from tables, cannot INSERT/UPDATE/DELETE
GRANT SELECT ON ALL TABLES IN SCHEMA company TO DataAnalyst;

-- Data Entry: Can SELECT, INSERT, UPDATE, but not DELETE in employees and departments
GRANT SELECT, INSERT, UPDATE ON company.employees TO DataEntry;
GRANT SELECT, INSERT, UPDATE ON company.departments TO DataEntry;
```

### Exercise 3: Test the Permissions
To test permissions, you need to connect as the newly created users. In pgAdmin, you can either:
1. Register a new server connection using the credentials of `alice_analyst` or `bob_entry`.
2. Use the `SET ROLE` command within your current session to simulate switching users:

```sql
-- Switch to the Data Analyst user
SET ROLE alice_analyst;

-- This should SUCCEED
SELECT * FROM company.employees;

-- This should FAIL (permission denied)
INSERT INTO company.employees (first_name, last_name) VALUES ('Test', 'User');

-- Switch back to the postgres superuser (user)
RESET ROLE;
```

### Exercise 4: View Current Permissions
Write queries to view the current permissions assigned to roles.

```sql
-- View table privileges granted to roles
SELECT grantee, table_schema, table_name, privilege_type 
FROM information_schema.role_table_grants 
WHERE grantee IN ('dataanalyst', 'dataentry');

-- View all server roles
SELECT rolname, rolsuper, rolcreaterole, rolcreatedb, rolcanlogin 
FROM pg_roles;
```

## 4. Stop the Environment

When you are finished with the lab, return to your terminal and run:

```bash
make down
```
This will stop and remove the Docker containers.
