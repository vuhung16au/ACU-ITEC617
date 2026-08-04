# SQL Injection Prevention Guide

This guide explains how to prevent SQL injection and how to monitor for attacks at the database level.

## 1. Parameterized Queries (The Standard Fix)

The primary defense against SQL injection is using **Parameterized Queries** (also known as Prepared Statements). 

Instead of concatenating user input directly into the query string, you use placeholders (e.g., `$1`, `$2`, or `?`). The database driver sends the query structure and the data values separately to the database engine. The engine treats the values strictly as data, never as executable code.

### Vulnerable Code (String Concatenation)
```javascript
// DANGEROUS
const query = `SELECT * FROM app.users WHERE username = '${username}'`;
const result = await pool.query(query);
```

### Secure Code (Parameterized)
```javascript
// SAFE
const query = 'SELECT * FROM app.users WHERE username = $1 AND password = $2';
const values = [username, password];
const result = await pool.query(query, values);
```

**Exercise:** 
1. Go back to `http://localhost:3000`.
2. Try the authentication bypass attack (`' OR '1'='1`) on the **Secure Login** form.
3. It will fail. The database literally searched for a user whose username was the string `"' OR '1'='1"`.

## 2. Stored Procedures

Stored Procedures can also prevent SQL injection if written correctly. Because the SQL statements within a stored procedure are predefined on the database server, passing parameters to a stored procedure functions similarly to parameterized queries.

*Warning: If a stored procedure uses dynamic SQL (e.g., `EXECUTE` with string concatenation internally), it can still be vulnerable to SQL injection.*

## 3. Auditing and Detection

In a production environment, you should log database activity to detect suspicious queries. 

In this lab, we configured PostgreSQL in `01-init.sql` to log all statements:
```sql
ALTER SYSTEM SET log_statement = 'all';
```

### Viewing the Logs
You can view the raw queries being executed against the database by inspecting the Docker logs.

1. Open a terminal.
2. Run the following command to view the logs of the PostgreSQL container:
   ```bash
   docker logs postgres-db-Week11-02-SQL-Injection
   ```
3. Look for the queries you injected. You will see exactly what the application sent to the database. For example:
   ```
   LOG:  statement: SELECT id, username, role FROM app.users WHERE username = ''; DROP TABLE app.secret_data; --'
   ```
Detecting these patterns (like unexpected `UNION` or `DROP` statements) is a key part of database security auditing.
