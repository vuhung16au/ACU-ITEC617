# Quickstart Guide

This guide walks you through analyzing database audit logs to detect security events using PostgreSQL.

## 1. Start the Environment

Open your terminal, navigate to this folder (`Week11/04.Database-Auditing`), and run:
```bash
make up
```
*Note: The database is configured to log all connections (successful and failed) and all SQL statements.*

## 2. Simulate Security Events

Before we can analyze logs, we need to generate some security events. Open your web browser and navigate to [http://localhost:5050](http://localhost:5050). Expand **Servers** -> **ITEC617 - Week 11 DB (Auditing)** and open the **Query Tool**.

### Event A: Unauthorized Access Attempt
Switch to the `bob_nurse` role and try to drop a table (which a nurse should not be able to do).
```sql
SET ROLE bob_nurse;
DROP TABLE compliance.medical_records; -- This will fail
RESET ROLE;
```

### Event B: Privilege Escalation Attempt
Switch to `alice_auditor` and try to give herself superuser privileges.
```sql
SET ROLE alice_auditor;
ALTER ROLE alice_auditor SUPERUSER; -- This will fail
RESET ROLE;
```

### Event C: Failed Logins (Brute Force Simulation)
To simulate failed logins, you can't easily do it inside the pgAdmin Query Tool if you are already logged in. Instead, open a new terminal on your host machine and try connecting with a bad password (you can press Ctrl+C after a few attempts):
```bash
docker exec -it postgres-db-Week11-04-Database-Auditing psql -U invalid_user -d itec617
```

## 3. Analyze the Audit Logs

In this PostgreSQL environment, the audit logs are sent to the standard output of the container. 

Open a terminal and run the following command to view the logs:
```bash
docker logs postgres-db-Week11-04-Database-Auditing
```

### Exercise 1: Find Unauthorized Access
Search the logs (you can pipe to `grep` or search manually) for the `DROP TABLE` command. You should see a log entry similar to this:
```text
LOG:  statement: DROP TABLE compliance.medical_records;
ERROR:  must be owner of table medical_records
```
This shows **who** tried to execute it (the connection context) and that it was denied.

### Exercise 2: Find Failed Logins
Search the logs for `FATAL:  password authentication failed` or `FATAL:  role "invalid_user" does not exist`.
```text
FATAL:  role "invalid_user" does not exist
```
If you see 5+ of these in a 1-minute window, it indicates a brute-force attack.

### Exercise 3: Real-time Monitoring with `pg_stat_activity`
While logs are historical, you can view current activity in real-time. In pgAdmin, run:
```sql
SELECT datname, usename, client_addr, state, query, query_start 
FROM pg_stat_activity 
WHERE state = 'active';
```

## 4. Learn the T-SQL Way
To see how structured auditing is done natively in Microsoft SQL Server and Azure SQL Database (using `sys.fn_get_audit_file`), read [docs/TSQL-Auditing-Concepts.md](docs/TSQL-Auditing-Concepts.md).

## 5. Stop the Environment
Run `make down` in the terminal when finished.
