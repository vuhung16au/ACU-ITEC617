# Student Enrollment Schema Overview

This example focuses on relational SQL querying operations using `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` between two tables.

## Tables

### 1. `Students`
Stores information about students.
*   `StudentID`: Primary key.
*   `StudentName`: The name of the student.
*   `Major`: The student's major.

### 2. `Enrollments`
Stores records of students enrolled in courses.
*   `EnrollmentID`: Primary key.
*   `StudentID`: Foreign key referencing the `Students` table.
*   `CourseName`: The name of the course.
*   `Grade`: The grade the student received (numeric for average calculations).
