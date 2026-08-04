# Hands-On Exercise 2: Fixing Partial Dependencies (2NF)

**Focus:** Recognizing and eliminating partial dependencies.

## Scenario
A university enrollment system stores records using a composite key (`StudentID`, `CourseID`). Many non-key attributes only depend on part of the primary key, leading to partial dependencies and update anomalies.

## Tasks
1. Create the table and insert 10 enrollment records (3 students, 4 courses).
2. Identify all partial dependencies using a dependency diagram.
3. Demonstrate an UPDATE anomaly (e.g., changing an instructor name requires updating multiple rows).
4. Decompose into 2NF tables: `Student`, `Course`, `Enrollment`.
5. Write migration SQL using `INSERT INTO ... SELECT`.
6. Prove data integrity with a COUNT query before and after migration.
