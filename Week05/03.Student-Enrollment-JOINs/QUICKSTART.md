# Quickstart Guide

This guide explains how to start the environment and interact with the database.

## 1. Start the Environment

Navigate to this directory in your terminal and run the following command to start the PostgreSQL database and pgAdmin containers:

```bash
make up
```

## 2. Connect to the Database (Seamless Setup)

1.  Open your web browser and navigate to [http://localhost:5050](http://localhost:5050).
2.  *Note: You will bypass the pgAdmin email/password login screen entirely.*
3.  On the left panel, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 05 DB (Topic 3)**.
4.  When prompted for a password, enter: `password` (You only need to do this once per session).
5.  Expand **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see the `Students` and `Enrollments` tables.

## 3. Practice SQL

1.  Right-click on the **itec617** database and select **Query Tool**.
2.  Try running the following tasks in the Query Tool:

**Task 1: Write an INNER JOIN to show students and their enrolled courses**
```sql
SELECT s."StudentName", e."CourseName"
FROM "Students" s
INNER JOIN "Enrollments" e ON s."StudentID" = e."StudentID";
```

**Task 2: Use LEFT JOIN to find students who haven't enrolled in any courses**
```sql
SELECT s."StudentName"
FROM "Students" s
LEFT JOIN "Enrollments" e ON s."StudentID" = e."StudentID"
WHERE e."EnrollmentID" IS NULL;
```

**Task 3: Use RIGHT JOIN to show all enrollments (even if student data is missing)**
```sql
SELECT s."StudentName", e."CourseName"
FROM "Students" s
RIGHT JOIN "Enrollments" e ON s."StudentID" = e."StudentID";
```

**Task 4: Calculate average grade per student using joins**
```sql
SELECT s."StudentName", AVG(e."Grade") as "AverageGrade"
FROM "Students" s
INNER JOIN "Enrollments" e ON s."StudentID" = e."StudentID"
GROUP BY s."StudentName";
```

**Task 5: Find students enrolled in more than 2 courses**
```sql
SELECT s."StudentName", COUNT(e."CourseName") as "CourseCount"
FROM "Students" s
INNER JOIN "Enrollments" e ON s."StudentID" = e."StudentID"
GROUP BY s."StudentName"
HAVING COUNT(e."CourseName") > 2;
```

## 4. Stop the Environment

When you are finished, run the following command to stop and remove the containers:

```bash
make down
```
