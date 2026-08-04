# Database Auditing in T-SQL

While this lab uses PostgreSQL's native logging capabilities, **Microsoft SQL Server** and **Azure SQL Database** provide a highly structured, built-in feature called **SQL Server Audit**.

SQL Server Audit allows you to create server-level or database-level audit specifications. The results are written to structured binary files, the Windows Security Event Log, or Azure Storage (in the cloud).

## 1. Creating an Audit

You first define where the audit logs will be stored.

```tsql
-- Create the Server Audit (Destinations can be FILE, SECURITY_LOG, or APPLICATION_LOG)
CREATE SERVER AUDIT SecurityAudit
TO FILE ( FILEPATH = 'C:\SQLAudit\' )
WITH (ON_FAILURE = CONTINUE);
GO

-- Enable the Audit
ALTER SERVER AUDIT SecurityAudit WITH (STATE = ON);
GO
```

## 2. Defining What to Audit

Next, you create a Database Audit Specification to define exactly which events or object groups you want to monitor.

```tsql
-- Switch to the specific database
USE itec617;
GO

-- Create an Audit Specification for the database
CREATE DATABASE AUDIT SPECIFICATION DB_Audit_Spec
FOR SERVER AUDIT SecurityAudit
-- Audit all SELECT, INSERT, UPDATE, DELETE on the medical_records table by anyone
ADD (SELECT, INSERT, UPDATE, DELETE ON compliance.medical_records BY public),
-- Audit any schema changes (like DROP TABLE)
ADD (SCHEMA_OBJECT_CHANGE_GROUP)
WITH (STATE = ON);
GO
```

## 3. Querying the Audit Logs

Unlike flat text logs (which we parse with `grep`), SQL Server provides a system function to query the binary audit files directly using SQL. This makes it incredibly easy to generate compliance reports.

### Analyzing logs with `sys.fn_get_audit_file`

```tsql
-- Query the audit files in the designated folder
SELECT 
    event_time,
    server_principal_name AS [User],
    action_id AS [Action],
    statement AS [Query_Executed],
    object_name AS [Target_Object],
    succeeded AS [Was_Successful]
FROM sys.fn_get_audit_file('C:\SQLAudit\*', DEFAULT, DEFAULT);
```

### Finding Failed Drop Table Attempts
```tsql
SELECT event_time, server_principal_name, statement
FROM sys.fn_get_audit_file('C:\SQLAudit\*', DEFAULT, DEFAULT)
WHERE statement LIKE '%DROP TABLE%' 
  AND succeeded = 0; -- 0 means the command failed (unauthorized)
```

### Detecting Brute Force Attacks (Failed Logins)
If you add the `FAILED_LOGIN_GROUP` to a Server Audit Specification, you can query failed logins.

```tsql
SELECT server_principal_name, COUNT(*) AS FailedAttempts
FROM sys.fn_get_audit_file('C:\SQLAudit\*', DEFAULT, DEFAULT)
WHERE action_id = 'LGIF' -- LGIF = Login Failed
  AND event_time > DATEADD(minute, -5, GETUTCDATE())
GROUP BY server_principal_name
HAVING COUNT(*) > 5; -- More than 5 failures in 5 minutes
```
