CREATE TABLE Students (
    StudentID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    EnrollmentDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Courses (
    CourseID SERIAL PRIMARY KEY,
    CourseName VARCHAR(200) NOT NULL,
    Credits INT NOT NULL,
    Instructor VARCHAR(200) NOT NULL
);

CREATE TABLE Enrollments (
    EnrollmentID SERIAL PRIMARY KEY,
    StudentID INT REFERENCES Students(StudentID),
    CourseID INT REFERENCES Courses(CourseID),
    Grade VARCHAR(5),
    Semester VARCHAR(50)
);

-- Insert Students
INSERT INTO Students (FirstName, LastName, EnrollmentDate) VALUES
('Harry', 'Potter', '2023-09-01'),
('Hermione', 'Granger', '2023-09-01'),
('Ron', 'Weasley', '2023-09-01'),
('Neville', 'Longbottom', '2023-09-01'),
('Luna', 'Lovegood', '2023-09-01'),
('Draco', 'Malfoy', '2023-09-01');

-- Insert Courses
INSERT INTO Courses (CourseName, Credits, Instructor) VALUES
('Potions 101', 3, 'Severus Snape'),
('Transfiguration', 4, 'Minerva McGonagall'),
('Defense Against the Dark Arts', 4, 'Remus Lupin'),
('Herbology', 3, 'Pomona Sprout'),
('Charms', 3, 'Filius Flitwick');

-- Insert Enrollments
-- Hermione is taking 4 courses (Challenge condition > 2)
-- Harry is taking 2 courses
-- Ron is taking 2 courses
-- Neville is taking 1 course
-- Draco is taking 1 course
-- Luna is taking 0 courses (for LEFT JOIN test)
INSERT INTO Enrollments (StudentID, CourseID, Grade, Semester) VALUES
(2, 1, 'O', 'Fall 2023'),
(2, 2, 'O', 'Fall 2023'),
(2, 3, 'O', 'Fall 2023'),
(2, 4, 'O', 'Fall 2023'),
(1, 2, 'E', 'Fall 2023'),
(1, 3, 'O', 'Fall 2023'),
(3, 1, 'A', 'Fall 2023'),
(3, 3, 'E', 'Fall 2023'),
(4, 4, 'O', 'Fall 2023'),
(6, 1, 'O', 'Fall 2023');
