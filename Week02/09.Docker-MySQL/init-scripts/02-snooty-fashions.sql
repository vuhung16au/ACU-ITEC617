-- =========================================================================
-- DATABASE 02: SNOOTY FASHIONS
-- Educational Schema for ITEC617
-- =========================================================================

CREATE DATABASE IF NOT EXISTS snooty_fashions;
USE snooty_fashions;

-- 1. DESIGNER TABLE
-- Tracks unique ID, SSN, and name components.
CREATE TABLE designer (
    designer_id INT AUTO_INCREMENT PRIMARY KEY,
    ssn VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 2. CUSTOMER TABLE
-- Customers who have made at least one purchase.
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 3. CUSTOMER_PHONE TABLE (Multivalued attribute resolution)
-- A customer can have multiple phone numbers.
CREATE TABLE customer_phone (
    customer_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    PRIMARY KEY (customer_id, phone_number),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 4. TAILORING TECHNICIAN TABLE
-- SSN is used as the unique identifier as per requirements.
CREATE TABLE tailoring_technician (
    ssn VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 5. OUTFIT TABLE
-- Each outfit has one designer and one customer (sold in advance).
CREATE TABLE outfit (
    outfit_id INT AUTO_INCREMENT PRIMARY KEY,
    designer_id INT NOT NULL,
    customer_id INT NOT NULL,
    planned_completion_date DATE,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (designer_id) REFERENCES designer(designer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 6. OUTFIT_TECHNICIAN TABLE (Many-to-Many resolution)
-- Technicians can work on many outfits, outfits can have many technicians.
-- Tracks the date when a technician started working on an outfit.
CREATE TABLE outfit_technician (
    outfit_id INT NOT NULL,
    technician_ssn VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    PRIMARY KEY (outfit_id, technician_ssn),
    FOREIGN KEY (outfit_id) REFERENCES outfit(outfit_id),
    FOREIGN KEY (technician_ssn) REFERENCES tailoring_technician(ssn)
);

-- 7. FASHION SHOW TABLE
CREATE TABLE fashion_show (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    show_date DATE NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- 8. SHOW_DESIGNER TABLE (Many-to-Many resolution)
-- A designer can participate in many shows, a show can feature 1 or 2 designers.
-- (Note: The 1 or 2 limit is typically enforced by application logic, not purely schema).
CREATE TABLE show_designer (
    show_id INT NOT NULL,
    designer_id INT NOT NULL,
    PRIMARY KEY (show_id, designer_id),
    FOREIGN KEY (show_id) REFERENCES fashion_show(show_id),
    FOREIGN KEY (designer_id) REFERENCES designer(designer_id)
);

-- =========================================================================
-- SAMPLE DATA
-- =========================================================================

INSERT INTO designer (ssn, first_name, last_name) VALUES
('111-222-333', 'Chloe', 'Nguyen'),
('444-555-666', 'Liam', 'Vu');

INSERT INTO customer (first_name, last_name) VALUES
('Emma', 'Johnson'),
('Oliver', 'Smith');

INSERT INTO customer_phone (customer_id, phone_number) VALUES
(1, '0400111222'),
(1, '0299887766'),
(2, '0411222333');

INSERT INTO tailoring_technician (ssn, first_name, last_name) VALUES
('777-888-999', 'Mia', 'Tran'),
('000-111-222', 'Noah', 'Le');

INSERT INTO outfit (designer_id, customer_id, planned_completion_date, price) VALUES
(1, 1, '2026-10-15', 1200.00),
(2, 2, '2026-11-20', 2500.00);

INSERT INTO outfit_technician (outfit_id, technician_ssn, start_date) VALUES
(1, '777-888-999', '2026-09-10'),
(2, '000-111-222', '2026-10-01');

INSERT INTO fashion_show (show_date, location) VALUES
('2026-12-01', 'Sydney Opera House'),
('2027-02-14', 'Melbourne Fashion Hub');

INSERT INTO show_designer (show_id, designer_id) VALUES
(1, 1),
(1, 2),
(2, 1);
