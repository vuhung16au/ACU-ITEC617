# Quickstart Guide

This guide explains how to start the environment, access the database, and run SQL queries.

## 1. Start the Environment

Open your terminal, navigate to this folder (`Week07/01.Library-Management`), and run:

```bash
make up
```

This command will start a PostgreSQL database and the pgAdmin web interface.

## 2. Access pgAdmin (Seamless Student Flow)

1. Open your web browser and go to `http://localhost:5050`
   - *Note: There is no pgAdmin email/password login screen.*
2. On the left sidebar, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 07 DB**.
3. When prompted, enter the database password: `password` (you only need to do this once per session).

## 3. Practice SQL

1. Expand the server to find your database: `Databases` -> `itec617`.
2. Right-click on the `itec617` database and select **Query Tool**.
3. You can now write and execute SQL queries. The tables `Books` and `Members` are already created and populated with sample data.

## 4. Stop the Environment

When you are finished, return to your terminal and run:

```bash
make down
```
