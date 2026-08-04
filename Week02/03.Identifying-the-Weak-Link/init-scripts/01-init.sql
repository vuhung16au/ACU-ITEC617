-- 01-init.sql
-- Reference Implementation for "Identifying the Weak Link" (Strong vs Weak Entities)

-- 1. Hotels Table (Strong Entity)
-- Hotels can exist independently and be uniquely identified by their own surrogate key.
CREATE TABLE hotels (
    hotel_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- 2. Rooms Table (Weak Entity)
-- Rooms cannot be uniquely identified just by their room_number (which is a partial key).
-- Their primary key must be a composite of the parent's PK and their own partial key.
CREATE TABLE rooms (
    hotel_id INT NOT NULL,
    room_number INT NOT NULL,
    bed_type VARCHAR(50) NOT NULL,
    
    -- Composite Primary Key: Uniquely identifies a room across the database
    PRIMARY KEY (hotel_id, room_number),
    
    -- Foreign Key: Identifies the parent entity this weak entity belongs to
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);

-- Sample Data (DML)
INSERT INTO hotels (name, city) VALUES
('Grand Sydney Hotel', 'Sydney'),
('Melbourne Central Suites', 'Melbourne');

-- Room 101 in Sydney
INSERT INTO rooms (hotel_id, room_number, bed_type) VALUES (1, 101, 'King');
-- Room 102 in Sydney
INSERT INTO rooms (hotel_id, room_number, bed_type) VALUES (1, 102, 'Queen');

-- Room 101 in Melbourne (Valid because PK is composite: hotel_id + room_number)
INSERT INTO rooms (hotel_id, room_number, bed_type) VALUES (2, 101, 'Double');
-- Room 201 in Melbourne
INSERT INTO rooms (hotel_id, room_number, bed_type) VALUES (2, 201, 'King');
