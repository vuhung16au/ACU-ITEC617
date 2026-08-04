# Quickstart Guide

This guide provides step-by-step instructions on how to start the lab environment, connect to the database, and run your analytical SQL queries.

## Prerequisites
* Docker and Docker Compose installed on your machine.

## Starting the Environment

1. Open your terminal and navigate to this topic's folder (`Week10/01.StarSchemaDesign`).
2. Run the following command to start the PostgreSQL database and pgAdmin containers in the background:
   ```bash
   make up
   ```
   *Note: This might take a minute or two the first time as it pulls the necessary Docker images and runs the initialization scripts.*

## Connecting to the Database via pgAdmin

We have configured pgAdmin for a seamless experience. There is no need to log in to pgAdmin itself or manually configure the server connection.

1. Open your web browser and go to: [http://localhost:5050](http://localhost:5050)
2. In the pgAdmin interface, look at the left sidebar under **Servers**.
3. Expand the **ITEC617 - Week 10 DB** server.
4. You will be prompted for a password. Enter: `password` (and you can check "Save Password" to avoid entering it again during this session).
5. Expand **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see the pre-created star schema tables.

## Running SQL Queries

1. Right-click on the **itec617** database and select **Query Tool**.
2. A new tab will open where you can write and execute your SQL queries.
3. Try answering the business questions from the `README.md`!

## Stopping the Environment

When you are finished with the exercise, you can stop and clean up the containers by running:
```bash
make down
```
