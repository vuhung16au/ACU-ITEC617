CREATE SCHEMA app;

CREATE TABLE app.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) DEFAULT 'user'
);

CREATE TABLE app.secret_data (
    id SERIAL PRIMARY KEY,
    secret_name VARCHAR(100),
    secret_value VARCHAR(255)
);

INSERT INTO app.users (username, password, role) VALUES
('admin', 'SuperSecretAdmin123!', 'admin'),
('john', 'password123', 'user'),
('jane', 'qwerty', 'user');

INSERT INTO app.secret_data (secret_name, secret_value) VALUES
('Bank Account', 'US1234567890'),
('API Key', 'ak_live_7x89z0a1b2c3d4e5f6'),
('Nuclear Codes', '00000000');

-- Configure Postgres to log all statements for audit purposes (detecting SQL injection)
ALTER SYSTEM SET log_statement = 'all';
SELECT pg_reload_conf();
