# Week 07, Topic 03: Student Enrollment System - JOINs Practice

## Overview
This workshop provides a multi-table database environment to practice `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and writing multi-table queries.

## Learning Objectives
*   Connect data across two tables using `INNER JOIN`.
*   Include unmatched rows from one table using `LEFT JOIN` or `RIGHT JOIN`.
*   Perform 3-table queries linking entities through a junction table.
*   Use `GROUP BY` and aggregate functions (`COUNT`) along with `JOIN` operations.
*   Filter grouped data using the `HAVING` clause.

## Workshop Scenarios (Challenge)
Write queries for the following scenarios in your Query Tool:
1.  List all students with their enrolled courses (using `INNER JOIN`).
2.  Show ALL students, including those who are not enrolled in any course (using `LEFT JOIN`).
3.  Find all courses with enrolled students, showing student names.
4.  Display the following columns: `Student Name`, `Course Name`, `Grade`, `Instructor` (Requires a 3-table `JOIN`).
5.  Count how many courses each student is currently taking.
6.  **Challenge:** Find students who are enrolled in more than 2 courses (Hint: Use `HAVING`).
