# Week 11 - 03. Dynamic Data Masking

## Overview
This topic explores **Dynamic Data Masking (DDM)**, a security feature that limits sensitive data exposure by masking it to non-privileged users. It is used to greatly simplify the design of security in your application by hiding sensitive data (like credit card numbers, emails, or salaries) in the result set of a query over designated database fields, while the data in the database is not changed.

## Focus
*   Identifying sensitive columns (email, phone, credit card, salary).
*   Understanding how masking functions work: default, email, partial, random.
*   Understanding the `UNMASK` permission.
*   Simulating Dynamic Data Masking in a standard SQL environment using **Views**.

*Note: The original request referenced T-SQL specific syntax (`ADD MASKED WITH`, `UNMASK`). Because this lab uses PostgreSQL to ensure open access without paid cloud subscriptions, we implement the masking concept using standard SQL Views. The exact T-SQL syntax is provided in the documentation for study.*

## Directory Structure
*   `docs/`: Contains the specific T-SQL implementation guide for Microsoft SQL Server/Azure SQL.
*   `init-scripts/`: SQL scripts that automatically create the schema (`sales.customers`) and insert sample data.
*   `docker-compose.yaml`: Docker configuration for the PostgreSQL database.

## Next Steps
Follow the instructions in the [QUICKSTART.md](QUICKSTART.md) file to perform the lab exercises.
