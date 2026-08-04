# Quickstart Guide

This guide will help you get the environment up and running for the "Eliminating Transitive Dependencies (3NF)" exercise.

## 1. Start the Environment
Open a terminal in this folder and run:
```bash
make up
```
This command starts the PostgreSQL database and pgAdmin using Docker Compose in the background.

## 2. Access pgAdmin
1. Go to `http://localhost:5050` in your web browser. There is **no** pgAdmin email/password login screen.
2. On the left side, under **Servers**, expand the pre-loaded server: **ITEC617 - Week 03 DB - 3NF**.
3. When prompted, enter the database password: `password` (you only need to do this once per session).
4. Open **Tools → Query Tool** to start writing and executing your SQL queries against the `itec617` database.

## 3. Stop the Environment
When you are finished, you can stop and remove the containers by running:
```bash
make down
```
