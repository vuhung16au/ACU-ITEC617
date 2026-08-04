# Quickstart Guide

## 1. Start the Environment

Open your terminal, navigate to this folder (`Week07/03.Student-Enrollment-JOINs`), and run:

```bash
make up
```

## 2. Access pgAdmin (Seamless Student Flow)

1. Open your web browser and go to `http://localhost:5050`
   - *Note: There is no pgAdmin email/password login screen.*
2. On the left sidebar, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 07 Topic 03 DB**.
3. When prompted, enter the database password: `password` (you only need to do this once).

## 3. Practice SQL

1. Expand the server to find your database: `Databases` -> `itec617`.
2. Right-click on the `itec617` database and select **Query Tool**.
3. Write queries against the `Students`, `Courses`, and `Enrollments` tables to complete the workshop scenarios in `README.md`.

## 4. Stop the Environment

When finished, run:

```bash
make down
```
