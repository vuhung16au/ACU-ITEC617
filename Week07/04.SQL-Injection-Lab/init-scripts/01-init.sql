CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Role VARCHAR(50) DEFAULT 'User'
);

-- Insert sample users (using plain text passwords for this injection demo)
INSERT INTO Users (Username, Password, Role) VALUES
('admin', 'SuperSecretAdminPwd99!', 'Admin'),
('john_doe', 'password123', 'User'),
('jane_smith', 'qwerty', 'User'),
('test_user', 'test', 'User');
