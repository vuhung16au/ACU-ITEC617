-- 01-init.sql
-- Reference Implementation for the "Business Rule to SQL" Translation Challenge

-- 1. Owners Table
-- We use a surrogate key (owner_id) because natural keys like phone numbers can change or be shared.
CREATE TABLE owners (
    owner_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    -- Backup phone number is optional (nullable), representing a simple multi-valued attribute rule
    backup_phone_number VARCHAR(20)
);

-- 2. Pets Table
-- We use a surrogate key (pet_id) as pet names are not unique.
-- Birthdate is stored; Age is a derived attribute and should NOT be stored as a column.
CREATE TABLE pets (
    pet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    weight_kg DECIMAL(5, 2) NOT NULL,
    species VARCHAR(50) NOT NULL CHECK (species IN ('Dog', 'Cat', 'Bird')),
    -- Foreign Key linking the pet to its owner
    owner_id INT NOT NULL,
    CONSTRAINT fk_pet_owner FOREIGN KEY (owner_id) REFERENCES owners(owner_id) ON DELETE CASCADE
);

-- Sample Data (DML)
INSERT INTO owners (first_name, last_name, phone_number, backup_phone_number) VALUES
('John', 'Doe', '555-0101', '555-0102'),
('Jane', 'Smith', '555-0202', NULL),
('Bob', 'Johnson', '555-0303', '555-0304');

INSERT INTO pets (name, birthdate, weight_kg, species, owner_id) VALUES
('Rex', '2019-05-14', 12.5, 'Dog', 1),
('Bella', '2021-08-22', 4.2, 'Cat', 1),
('Tweety', '2023-01-10', 0.1, 'Bird', 2),
('Max', '2018-11-30', 25.0, 'Dog', 3);
