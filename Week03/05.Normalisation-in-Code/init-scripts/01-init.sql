-- This initialization script provides an alternative SQL version of the dataset
-- However, the main lesson focuses on the Python script (`normalise.py`) 
-- which builds an SQLite database directly from `data.csv`.

CREATE TABLE UnnormalisedData (
    StudentID INT,
    StudentName VARCHAR(100),
    CourseID VARCHAR(10),
    CourseName VARCHAR(100),
    Instructor VARCHAR(100),
    InstructorEmail VARCHAR(100),
    Room VARCHAR(50)
);

INSERT INTO UnnormalisedData VALUES
(101, 'Alice Smith', 'C1', 'Database Systems', 'Dr. Codd', 'codd@db.com', 'R100'),
(101, 'Alice Smith', 'C2', 'Programming', 'Dr. Turing', 'turing@cs.com', 'R200'),
(102, 'Bob Jones', 'C1', 'Database Systems', 'Dr. Codd', 'codd@db.com', 'R100'),
(103, 'Charlie Brown', 'C3', 'Web Dev', 'Dr. Berners-Lee', 'tim@web.com', 'R300'),
(102, 'Bob Jones', 'C3', 'Web Dev', 'Dr. Berners-Lee', 'tim@web.com', 'R300');
