# Quickstart Guide

Follow these steps to run the PostgreSQL database and pgAdmin for this example.

## Prerequisites
* Docker
* Docker Compose

## Starting the Environment

1. Open your terminal and navigate to this folder:
   ```bash
   cd path/to/Week02/02.Many-to-Many
   ```

2. Start the database and pgAdmin containers in the background:
   ```bash
   make up
   ```

3. The initialization script (`init-scripts/01-init.sql`) will automatically execute, creating the tables and inserting sample data.

## Accessing pgAdmin

1. Open your web browser and go to [http://localhost:5050](http://localhost:5050).
2. There is **no** pgAdmin email/password login screen — you go straight to the dashboard.
3. On the left, under **Servers**, expand **ITEC617 - Week 2 DB**.
4. When prompted, enter the database password only: `password` (once per session).
5. Open **Tools → Query Tool** to practice SQL.

## Try These Queries

After connecting, explore the resolved M:N design:

```sql
-- Which courses is Alice enrolled in?
SELECT s.first_name, s.last_name, c.course_code, c.course_name, e.enrolled_on
FROM enrollment e
JOIN students s ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id
WHERE s.first_name = 'Alice';

-- Which students are taking Database Systems?
SELECT c.course_code, s.first_name, s.last_name, e.grade
FROM enrollment e
JOIN students s ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id
WHERE c.course_code = 'ITEC617';
```

## Cleaning Up

To stop and remove the containers, run:
```bash
make down
```
*(To also remove the database volume for a clean slate, run `docker compose down -v`.)*
