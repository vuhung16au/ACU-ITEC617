# Schema Overview: Fixing Partial Dependencies (2NF)

This exercise demonstrates the normalization process from a 1NF table with partial dependencies to Second Normal Form (2NF).

## Unnormalized Schema (1NF with Partial Dependencies)
*   **EnrollmentFlat**: The original table containing partial dependencies. The primary key is composite (`StudentID`, `CourseID`).
    *   `StudentID` (INT, PK)
    *   `CourseID` (INT, PK)
    *   `StudentName` (VARCHAR) - *Partially dependent (depends only on StudentID)*
    *   `StudentEmail` (VARCHAR) - *Partially dependent (depends only on StudentID)*
    *   `CourseName` (VARCHAR) - *Partially dependent (depends only on CourseID)*
    *   `InstructorName` (VARCHAR) - *Partially dependent (depends only on CourseID)*
    *   `Credits` (INT) - *Partially dependent (depends only on CourseID)*
    *   `Grade` (CHAR(2)) - *Fully dependent on both StudentID and CourseID*

## Normalized Schema (2NF)
To eliminate partial dependencies and adhere to 2NF, the data is separated into related tables based on functional dependencies:
*   **Student**: Stores attributes fully dependent on `StudentID`.
    *   `StudentID` (INT, PRIMARY KEY)
    *   `StudentName` (VARCHAR)
    *   `StudentEmail` (VARCHAR)
*   **Course**: Stores attributes fully dependent on `CourseID`.
    *   `CourseID` (INT, PRIMARY KEY)
    *   `CourseName` (VARCHAR)
    *   `InstructorName` (VARCHAR)
    *   `Credits` (INT)
*   **Enrollment**: Stores attributes dependent on the full composite key.
    *   `StudentID` (INT, FOREIGN KEY)
    *   `CourseID` (INT, FOREIGN KEY)
    *   `Grade` (CHAR(2))
    *   *(PRIMARY KEY is composite: StudentID, CourseID)*
