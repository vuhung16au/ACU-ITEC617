-- =========================================================================
-- DATABASE 01: MEDICAL CLINIC
-- Educational Schema for ITEC617
-- =========================================================================

CREATE DATABASE IF NOT EXISTS medical_clinic;
USE medical_clinic;

-- 1. PATIENT TABLE
-- Stores patient details.
CREATE TABLE patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 2. DOCTOR TABLE
-- Stores doctor details.
CREATE TABLE doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100)
);

-- 3. APPOINTMENT TABLE
-- A patient can make many appointments with one or more doctors.
-- "unscheduled" handles emergencies.
CREATE TABLE appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('scheduled', 'unscheduled', 'kept', 'cancelled') DEFAULT 'scheduled',
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

-- 4. VISIT TABLE
-- If kept, an appointment yields a visit. Contains diagnosis and treatment.
-- Updating this effectively updates the patient's medical history.
CREATE TABLE visit (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE, -- 1:1 relationship with appointment
    visit_date DATETIME NOT NULL,
    diagnosis TEXT,
    treatment TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);

-- 5. BILL TABLE
-- Each visit creates a bill. Billed by one doctor.
CREATE TABLE bill (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT NOT NULL UNIQUE, -- 1:1 relationship with visit
    doctor_id INT NOT NULL, -- The doctor who billed the visit
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES visit(visit_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

-- 6. INSURANCE COMPANY TABLE
CREATE TABLE insurance_company (
    insurance_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL
);

-- 7. CLAIM TABLE
-- If the bill is submitted to an insurance company, we track the claim and deductible.
CREATE TABLE claim (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    bill_id INT NOT NULL,
    insurance_id INT NOT NULL,
    deductible_amount DECIMAL(10, 2) DEFAULT 0.00, -- Amount patient needs to pay
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id),
    FOREIGN KEY (insurance_id) REFERENCES insurance_company(insurance_id)
);

-- 8. PAYMENT TABLE
-- Represents a physical payment transaction made by a patient.
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_date DATETIME NOT NULL,
    total_amount_paid DECIMAL(10, 2) NOT NULL
);

-- 9. BILL_PAYMENT TABLE (Many-to-Many resolution)
-- A bill may be paid in many installments, and a payment may cover more than one bill.
CREATE TABLE bill_payment (
    bill_id INT NOT NULL,
    payment_id INT NOT NULL,
    amount_applied DECIMAL(10, 2) NOT NULL, -- How much of the payment goes to this bill
    PRIMARY KEY (bill_id, payment_id),
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);

-- =========================================================================
-- SAMPLE DATA
-- =========================================================================

INSERT INTO patient (first_name, last_name) VALUES
('Hung', 'Vu'),
('Minh', 'Nguyen'),
('Sarah', 'Smith');

INSERT INTO doctor (first_name, last_name, specialty) VALUES
('Alice', 'Jones', 'General Practice'),
('Bob', 'Brown', 'Cardiology');

INSERT INTO appointment (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2026-09-01 10:00:00', 'kept'),
(2, 2, '2026-09-02 11:30:00', 'scheduled'),
(3, 1, '2026-09-03 09:00:00', 'unscheduled'); -- emergency

INSERT INTO visit (appointment_id, visit_date, diagnosis, treatment) VALUES
(1, '2026-09-01 10:30:00', 'Common Cold', 'Rest and hydration'),
(3, '2026-09-03 09:45:00', 'Sprained Ankle', 'Bandage and pain relief');

INSERT INTO bill (visit_id, doctor_id, total_amount) VALUES
(1, 1, 150.00),
(2, 1, 250.00); 

INSERT INTO insurance_company (company_name) VALUES
('Medibank Private'),
('Bupa Australia');

INSERT INTO claim (bill_id, insurance_id, deductible_amount) VALUES
(1, 1, 50.00);

INSERT INTO payment (payment_date, total_amount_paid) VALUES
('2026-09-05 14:00:00', 50.00),
('2026-09-06 10:00:00', 250.00);

INSERT INTO bill_payment (bill_id, payment_id, amount_applied) VALUES
(1, 1, 50.00),
(2, 2, 250.00);
