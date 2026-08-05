-- Initialize the database schema

CREATE TABLE IF NOT EXISTS australian_students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert synthetic mock data
INSERT INTO australian_students (first_name, last_name, email, city, state) VALUES
('Vu', 'Nguyen', 'vu.nguyen@example.com.au', 'Sydney', 'NSW'),
('Anh', 'Tran', 'anh.tran@example.com.au', 'Melbourne', 'VIC'),
('Binh', 'Le', 'binh.le@example.com.au', 'Brisbane', 'QLD'),
('Liam', 'Smith', 'liam.smith@example.com.au', 'Perth', 'WA'),
('Olivia', 'Jones', 'olivia.jones@example.com.au', 'Adelaide', 'SA')
ON CONFLICT (email) DO NOTHING;
