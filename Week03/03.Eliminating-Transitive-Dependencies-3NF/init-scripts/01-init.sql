-- 1. Create the Appointment Table (2NF with Transitive Dependencies)
CREATE TABLE AppointmentFlat (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    PatientName VARCHAR(100),
    DoctorID INT,
    DoctorName VARCHAR(100),        -- Transitive: AppointmentID -> DoctorID -> DoctorName
    DoctorSpecialty VARCHAR(50),    -- Transitive: AppointmentID -> DoctorID -> DoctorSpecialty
    DepartmentName VARCHAR(50),     -- Transitive: AppointmentID -> DoctorID -> DepartmentName
    AppointmentDate TIMESTAMP
);

-- Task 1: Insert 15 appointments across 5 doctors
INSERT INTO AppointmentFlat (AppointmentID, PatientID, PatientName, DoctorID, DoctorName, DoctorSpecialty, DepartmentName, AppointmentDate) VALUES
(1, 101, 'John Doe', 1, 'Dr. Smith', 'Cardiology', 'Heart Center', '2026-09-01 09:00:00'),
(2, 102, 'Jane Smith', 2, 'Dr. Brown', 'Neurology', 'Brain Institute', '2026-09-01 10:00:00'),
(3, 103, 'Bob Johnson', 3, 'Dr. White', 'Orthopedics', 'Bone & Joint', '2026-09-01 11:00:00'),
(4, 104, 'Alice Green', 4, 'Dr. Green', 'Pediatrics', 'Childrens Ward', '2026-09-02 09:00:00'),
(5, 105, 'Charlie Day', 5, 'Dr. Black', 'Dermatology', 'Skin Care', '2026-09-02 10:00:00'),
(6, 101, 'John Doe', 2, 'Dr. Brown', 'Neurology', 'Brain Institute', '2026-09-03 14:00:00'),
(7, 106, 'Eve Adams', 1, 'Dr. Smith', 'Cardiology', 'Heart Center', '2026-09-03 15:00:00'),
(8, 107, 'Frank Castle', 3, 'Dr. White', 'Orthopedics', 'Bone & Joint', '2026-09-04 09:00:00'),
(9, 108, 'Grace Lee', 4, 'Dr. Green', 'Pediatrics', 'Childrens Ward', '2026-09-04 10:00:00'),
(10, 102, 'Jane Smith', 5, 'Dr. Black', 'Dermatology', 'Skin Care', '2026-09-05 11:00:00'),
(11, 109, 'Hank Pym', 1, 'Dr. Smith', 'Cardiology', 'Heart Center', '2026-09-05 13:00:00'),
(12, 110, 'Ivy Poison', 2, 'Dr. Brown', 'Neurology', 'Brain Institute', '2026-09-06 14:00:00'),
(13, 103, 'Bob Johnson', 4, 'Dr. Green', 'Pediatrics', 'Childrens Ward', '2026-09-06 15:00:00'),
(14, 104, 'Alice Green', 3, 'Dr. White', 'Orthopedics', 'Bone & Joint', '2026-09-07 09:00:00'),
(15, 105, 'Charlie Day', 1, 'Dr. Smith', 'Cardiology', 'Heart Center', '2026-09-07 10:00:00');

-- ----------------------------------------------------------------------------------
-- The following schema is provided as the target normalized state (3NF).
-- Students will practice designing these and migrating the data in the exercise.
-- ----------------------------------------------------------------------------------

-- CREATE TABLE Patient (
--     PatientID INT PRIMARY KEY,
--     PatientName VARCHAR(100)
-- );

-- CREATE TABLE Department (
--     DepartmentID SERIAL PRIMARY KEY,
--     DepartmentName VARCHAR(50) UNIQUE
-- );

-- CREATE TABLE Doctor (
--     DoctorID INT PRIMARY KEY,
--     DoctorName VARCHAR(100),
--     DoctorSpecialty VARCHAR(50),
--     DepartmentID INT REFERENCES Department(DepartmentID)
-- );

-- CREATE TABLE Appointment (
--     AppointmentID INT PRIMARY KEY,
--     PatientID INT REFERENCES Patient(PatientID),
--     DoctorID INT REFERENCES Doctor(DoctorID),
--     AppointmentDate TIMESTAMP
-- );

-- ----------------------------------------------------------------------------------
-- Task 3 (Demonstrate UPDATE Anomaly) and Tasks 5 & 6 (Storage Comparison and JOINs) 
-- will be completed by students.
-- ----------------------------------------------------------------------------------
