CREATE TABLE "Students" (
    "StudentID" SERIAL PRIMARY KEY,
    "StudentName" VARCHAR(255) NOT NULL,
    "Major" VARCHAR(100)
);

CREATE TABLE "Enrollments" (
    "EnrollmentID" SERIAL PRIMARY KEY,
    "StudentID" INT,
    "CourseName" VARCHAR(255) NOT NULL,
    "Grade" DECIMAL(5,2)
);

INSERT INTO "Students" ("StudentName", "Major") VALUES
('Alice Smith', 'Computer Science'),
('Bob Johnson', 'Mathematics'),
('Charlie Brown', 'Physics'),
('Diana Prince', 'History'); -- Student with no enrollments

INSERT INTO "Enrollments" ("StudentID", "CourseName", "Grade") VALUES
(1, 'Database Systems', 95.0),
(1, 'Algorithms', 88.5),
(1, 'Operating Systems', 92.0),
(2, 'Linear Algebra', 78.0),
(2, 'Calculus II', 85.0),
(3, 'Quantum Mechanics', 90.0),
(NULL, 'Intro to Psychology', NULL); -- Enrollment with missing student data
