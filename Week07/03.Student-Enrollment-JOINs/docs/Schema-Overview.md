# Student Enrollment System Schema Overview

This topic focuses on writing `JOIN` queries using three related tables.

## Tables

### 1. Students
Stores information about the students.
*   **StudentID**: Primary Key.
*   **FirstName**: The student's first name.
*   **LastName**: The student's last name.
*   **EnrollmentDate**: The date the student was admitted.

### 2. Courses
Stores information about the available courses.
*   **CourseID**: Primary Key.
*   **CourseName**: The name of the course.
*   **Credits**: Number of credits for the course.
*   **Instructor**: Name of the course instructor.

### 3. Enrollments
An associative (junction) table mapping which students are taking which courses.
*   **EnrollmentID**: Primary Key.
*   **StudentID**: Foreign Key pointing to the `Students` table.
*   **CourseID**: Foreign Key pointing to the `Courses` table.
*   **Grade**: The grade received by the student (can be NULL if the course is ongoing).
*   **Semester**: The semester of enrollment.
