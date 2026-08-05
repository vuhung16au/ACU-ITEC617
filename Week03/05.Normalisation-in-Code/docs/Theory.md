# Normalisation in Code

This topic translates the abstract mathematical concepts of database normalisation into executable logic. Rather than just learning the rules of First (1NF), Second (2NF), and Third Normal Form (3NF), this exercise demonstrates how code is used to parse, clean, and structure raw "dirty" data.

## 0NF to 1NF: Identifying Granularity
The raw CSV has repeating columns and redundant records. The code reads this flat file and iterates through it, treating each row as a discrete record.

## 1NF to 2NF: Removing Partial Dependencies
In the original composite structure (StudentID + CourseID), attributes like `StudentName` only depend on `StudentID`, and `CourseName` only depends on `CourseID`. Our Python dictionary logic isolates unique students and unique courses independently of the enrollment pairs.

## 2NF to 3NF: Removing Transitive Dependencies
Within the course details, `InstructorEmail` depends on `InstructorName` rather than the `CourseID` itself. In our script, we construct a dedicated mapping (the `Instructors` table) to separate these entities, ensuring that if an instructor's email changes, it only updates in one place.

## The Power of Python + SQL
By combining Python dictionaries/sets with SQLite `INSERT` statements, we systematically strip away the duplication and insert the cleansed data into a strictly typed, relational database schema.
