-- 1. Create the Enrollment Table (1NF with Partial Dependencies)
CREATE TABLE EnrollmentFlat (
    StudentID INT,
    CourseID INT,
    StudentName VARCHAR(100),       -- Only depends on StudentID
    StudentEmail VARCHAR(100),      -- Only depends on StudentID
    CourseName VARCHAR(100),        -- Only depends on CourseID
    InstructorName VARCHAR(100),    -- Only depends on CourseID
    Credits INT,                    -- Only depends on CourseID
    Grade CHAR(2),                  -- Depends on BOTH
    PRIMARY KEY (StudentID, CourseID)
);

-- Task 1: Insert 10 enrollment records (3 students, 4 courses)
INSERT INTO EnrollmentFlat (StudentID, CourseID, StudentName, StudentEmail, CourseName, InstructorName, Credits, Grade) VALUES
(1, 101, 'Alice Smith', 'alice@example.com', 'Database Systems', 'Dr. Codd', 3, 'A'),
(1, 102, 'Alice Smith', 'alice@example.com', 'Web Development', 'Dr. Berners-Lee', 4, 'B+'),
(1, 103, 'Alice Smith', 'alice@example.com', 'Algorithms', 'Dr. Knuth', 4, 'A-'),
(2, 101, 'Bob Jones', 'bob@example.com', 'Database Systems', 'Dr. Codd', 3, 'B'),
(2, 104, 'Bob Jones', 'bob@example.com', 'Machine Learning', 'Dr. Turing', 4, 'C+'),
(2, 102, 'Bob Jones', 'bob@example.com', 'Web Development', 'Dr. Berners-Lee', 4, 'A'),
(3, 101, 'Charlie Brown', 'charlie@example.com', 'Database Systems', 'Dr. Codd', 3, 'B+'),
(3, 103, 'Charlie Brown', 'charlie@example.com', 'Algorithms', 'Dr. Knuth', 4, 'B-'),
(3, 104, 'Charlie Brown', 'charlie@example.com', 'Machine Learning', 'Dr. Turing', 4, 'A-'),
(1, 104, 'Alice Smith', 'alice@example.com', 'Machine Learning', 'Dr. Turing', 4, 'A');

-- ----------------------------------------------------------------------------------
-- The following schema is provided as the target normalized state (2NF).
-- Students will practice designing these and migrating the data in the exercise.
-- ----------------------------------------------------------------------------------

-- CREATE TABLE Student (
--     StudentID INT PRIMARY KEY,
--     StudentName VARCHAR(100),
--     StudentEmail VARCHAR(100)
-- );

-- CREATE TABLE Course (
--     CourseID INT PRIMARY KEY,
--     CourseName VARCHAR(100),
--     InstructorName VARCHAR(100),
--     Credits INT
-- );

-- CREATE TABLE Enrollment (
--     StudentID INT REFERENCES Student(StudentID),
--     CourseID INT REFERENCES Course(CourseID),
--     Grade CHAR(2),
--     PRIMARY KEY (StudentID, CourseID)
-- );

-- ----------------------------------------------------------------------------------
-- Task 3 (Demonstrate UPDATE Anomaly) and Tasks 5 & 6 (Migration and Verification) 
-- will be completed by students.
-- ----------------------------------------------------------------------------------
