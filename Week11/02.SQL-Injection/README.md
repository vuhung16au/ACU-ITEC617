# Week 11 - 02. SQL Injection Attack Simulation and Prevention

## Overview
This topic provides a safe, isolated lab environment to demonstrate the mechanics and dangers of **SQL Injection (SQLi)** vulnerabilities. You will interact with a deliberately vulnerable Node.js web application to execute unauthorized database commands, and then examine the secure version of the code to understand how to prevent these attacks.

## Learning Objectives
*   Understand how string concatenation in SQL queries creates vulnerabilities.
*   Perform Authentication Bypass, UNION-based data extraction, and Stacked Queries attacks.
*   Learn how **Parameterized Queries** completely neutralize SQL injection.
*   Detect SQL injection attempts by reviewing database audit logs.

## Directory Structure
*   `app/`: Contains the source code for the vulnerable Node.js web application.
*   `docs/`: Contains guides for exploiting the application and preventing the vulnerabilities.
*   `init-scripts/`: SQL script that creates the `app.users` and `app.secret_data` tables.
*   `docker-compose.yaml`: Configures the database, the pgAdmin tool, and the web application.

## Next Steps
1.  Read the [QUICKSTART.md](QUICKSTART.md) to launch the environment.
2.  Follow the [Exploitation Guide](docs/Exploitation-Guide.md) to perform attacks against the application.
3.  Read the [Prevention Guide](docs/Prevention-Guide.md) to understand how to fix the code and secure the database.
