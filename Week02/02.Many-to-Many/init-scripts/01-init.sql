-- 01-init.sql
-- Reference Implementation for Fixing the "Many-to-Many" Mess
--
-- Business rule: A student can take many courses, and a course can have many students (M:N).
-- Resolution: Introduce an Enrollment bridge/associative entity with two FKs and a composite PK.

-- 1. Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- 2. Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(200) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0)
);

-- 3. Enrollment Table (Bridge / Associative Entity)
-- Composite Primary Key (student_id, course_id) prevents duplicate enrollments.
-- Two Foreign Keys implement Student 1:M Enrollment M:1 Course (= original M:N).
CREATE TABLE enrollment (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_on DATE NOT NULL DEFAULT CURRENT_DATE,
    grade VARCHAR(2),
    CONSTRAINT pk_enrollment PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Sample Data (DML)
INSERT INTO students (first_name, last_name, email) VALUES
('Alice', 'Nguyen', 'alice.nguyen@itec617.student.acu.edu.xyz'),
('Ben', 'Patel', 'ben.patel@itec617.student.acu.edu.xyz'),
('Chloe', 'Martin', 'chloe.martin@itec617.student.acu.edu.xyz'),
('Diego', 'Rossi', 'diego.rossi@itec617.student.acu.edu.xyz');

INSERT INTO courses (course_code, course_name, credits) VALUES
('ITEC617', 'Database Systems', 10),
('ITEC201', 'Introduction to Programming', 10),
('BUSN104', 'Money Matters', 10),
('ITEC311', 'Web Application Development', 10);

-- Alice takes two courses; ITEC617 has three students — demonstrates true M:N
INSERT INTO enrollment (student_id, course_id, enrolled_on, grade) VALUES
(1, 1, '2026-02-24', 'HD'),  -- Alice → ITEC617
(1, 2, '2026-02-24', 'D'),   -- Alice → ITEC201
(2, 1, '2026-02-25', 'C'),   -- Ben → ITEC617
(2, 3, '2026-02-25', NULL),  -- Ben → BUSN104 (no grade yet)
(3, 1, '2026-02-26', 'D'),   -- Chloe → ITEC617
(3, 4, '2026-02-26', 'HD'),  -- Chloe → ITEC311
(4, 2, '2026-02-27', 'P');   -- Diego → ITEC201
