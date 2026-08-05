-- Create students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Create courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    credits INT NOT NULL
);

-- Create enrollments table
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    semester VARCHAR(20) NOT NULL,
    UNIQUE(student_id, course_id, semester)
);

-- Insert sample data into students
INSERT INTO students (first_name, last_name, email, city) VALUES
    ('Vu', 'Nguyen', 'vu.nguyen@example.com', 'Sydney'),
    ('Olivia', 'Smith', 'olivia.s@example.com', 'Melbourne'),
    ('Jackson', 'Jones', 'j.jones@example.com', 'Brisbane'),
    ('Mia', 'Williams', 'mia.w@example.com', 'Perth');

-- Insert sample data into courses
INSERT INTO courses (course_code, course_name, credits) VALUES
    ('ITEC617', 'Database Systems', 10),
    ('COMP101', 'Introduction to Programming', 10),
    ('ENG102', 'Software Engineering Principles', 10);

-- Insert sample data into enrollments
INSERT INTO enrollments (student_id, course_id, semester) VALUES
    (1, 1, 'Semester 1 2026'),
    (1, 2, 'Semester 1 2026'),
    (2, 1, 'Semester 1 2026'),
    (3, 3, 'Semester 1 2026'),
    (4, 2, 'Semester 1 2026');
