-- Schema and seed data for the SQL Injection demo
-- Passwords are stored in plaintext intentionally so students can see
-- what an attacker extracts. NEVER do this in a real application.

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email, password) VALUES
    ('admin',  'admin@acu.edu.au',              'Adm1nS3cret!'),
    ('vnguyen','vu.nguyen@example.com.au',      'CoffeeSydney2024'),
    ('atran',  'anh.tran@example.com.au',       'MelbourneRain!'),
    ('ble',    'binh.le@example.com.au',        'BrisbaneSun99'),
    ('lsmith', 'liam.smith@example.com.au',     'PerthWaves#1'),
    ('ojones', 'olivia.jones@example.com.au',   'AdelaideHills42')
ON CONFLICT (username) DO NOTHING;

-- Helpful for time-based blind demos (pg_sleep is built-in).
-- Log statements so students can inspect injected queries in the Postgres logs.
ALTER SYSTEM SET log_statement = 'all';
SELECT pg_reload_conf();
