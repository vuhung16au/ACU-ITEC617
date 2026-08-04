# Week 11 - 04. Database Auditing and Security Monitoring

## Overview
This topic covers **Database Auditing**, a crucial component of compliance and security monitoring. Auditing involves recording database events to detect suspicious activities (like brute-force login attempts or unauthorized data access) and to prove compliance with regulations (like HIPAA, GDPR, or PCI-DSS).

## Focus
*   Enabling database auditing and logging.
*   Analyzing audit logs to detect patterns: failed logins, unauthorized access, privilege escalation.
*   Simulating an attack and finding the evidence in the logs.
*   Understanding the differences between standard log files (PostgreSQL) and structured audit features (SQL Server).

*Note: The original request referenced T-SQL specific features (`SQL Server Audit`, `sys.fn_get_audit_file`). Because this lab uses PostgreSQL to ensure open access without paid cloud subscriptions, we implement auditing using PostgreSQL's native logging facilities. The exact T-SQL syntax is provided in the documentation for study.*

## Directory Structure
*   `docs/`: Contains the specific T-SQL implementation guide for Microsoft SQL Server/Azure SQL Database Auditing.
*   `init-scripts/`: SQL scripts that automatically create the schema (`compliance.medical_records`), set up roles, and enable strict PostgreSQL auditing configurations.
*   `docker-compose.yaml`: Docker configuration for the PostgreSQL database.

## Next Steps
Follow the instructions in the [QUICKSTART.md](QUICKSTART.md) file to perform the lab exercises.
