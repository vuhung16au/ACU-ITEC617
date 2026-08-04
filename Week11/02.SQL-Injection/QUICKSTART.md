# Quickstart Guide

This guide will help you start the SQL Injection lab environment.

## 1. Start the Environment

Open your terminal, navigate to this folder (`Week11/02.SQL-Injection`), and run:

```bash
make up
```

This will build and start three containers:
- **`postgres`**: The database server containing the vulnerable tables.
- **`pgadmin`**: The database management UI (optional, on port 5050).
- **`webapp`**: The vulnerable Node.js application.

*Note: The first time you run this, it may take a minute to download and build the Node.js image.*

## 2. Access the Vulnerable Web Application

1. Open your web browser and navigate to [http://localhost:3000](http://localhost:3000).
2. You will see the **ACU-ITEC617 SQL Injection Lab** interface.
3. Keep this page open. You will use the forms on this page to perform your attacks.

## 3. (Optional) Access the Database via pgAdmin

If you want to view the raw tables or verify that your attacks modified the database:
1. Navigate to [http://localhost:5050](http://localhost:5050).
2. Expand **Servers** on the left.
3. Click on **ITEC617 - Week 11 DB (SQL Injection)**.
4. When prompted, enter the password: `password`.
5. Expand `Databases` -> `itec617` -> `Schemas` -> `app` -> `Tables` to view `users` and `secret_data`.

## 4. Proceed to Exercises

Now that the environment is running:
1. Open the [Exploitation Guide](docs/Exploitation-Guide.md) to learn how to attack the application.
2. Open the [Prevention Guide](docs/Prevention-Guide.md) to learn how to secure the application.

## 5. Stop the Environment

When you are finished with the lab, return to your terminal and run:

```bash
make down
```
