CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

INSERT INTO users (first_name, last_name, email, city, state) VALUES 
('Hung', 'Vu', 'hung.vu@example.com.au', 'Sydney', 'NSW'),
('Anh', 'Nguyen', 'anh.nguyen@example.com.au', 'Melbourne', 'VIC'),
('Emma', 'Smith', 'emma.smith@example.com.au', 'Brisbane', 'QLD'),
('Liam', 'Jones', 'liam.jones@example.com.au', 'Perth', 'WA');
