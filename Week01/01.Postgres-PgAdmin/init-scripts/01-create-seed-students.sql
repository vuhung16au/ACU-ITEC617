CREATE TABLE Students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    enrollment_date DATE
);

-- Seed 100 sample records
INSERT INTO Students (first_name, last_name, email, enrollment_date)
SELECT 
    'FirstName' || i, 
    'LastName' || i, 
    'student' || i || '@example.com',
    CURRENT_DATE - (i % 365)
FROM generate_series(1, 100) AS s(i);
