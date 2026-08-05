-- Create a simple users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert synthetic Australian data
INSERT INTO users (first_name, last_name, email, city, state) VALUES
('Vu', 'Nguyen', 'vu.nguyen@example.com', 'Sydney', 'NSW'),
('Thanh', 'Tran', 'thanh.tran@example.com', 'Melbourne', 'VIC'),
('Liam', 'Smith', 'liam.smith@example.com', 'Brisbane', 'QLD'),
('Olivia', 'Jones', 'olivia.jones@example.com', 'Perth', 'WA'),
('Noah', 'Williams', 'noah.williams@example.com', 'Adelaide', 'SA'),
('Charlotte', 'Brown', 'charlotte.brown@example.com', 'Hobart', 'TAS'),
('Oliver', 'Wilson', 'oliver.wilson@example.com', 'Darwin', 'NT'),
('Amelia', 'Taylor', 'amelia.taylor@example.com', 'Canberra', 'ACT'),
('Minh', 'Le', 'minh.le@example.com', 'Sydney', 'NSW'),
('Bao', 'Pham', 'bao.pham@example.com', 'Melbourne', 'VIC');
