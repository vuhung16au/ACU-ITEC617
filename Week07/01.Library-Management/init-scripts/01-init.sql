-- Create Books table
CREATE TABLE Books (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedYear INT,
    AvailableCopies INT DEFAULT 0
);

-- Create Members table
CREATE TABLE Members (
    MemberID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    JoinDate DATE DEFAULT CURRENT_DATE,
    IsActive BOOLEAN DEFAULT TRUE
);

-- Insert sample data into Books (at least 10 books)
INSERT INTO Books (Title, Author, ISBN, PublishedYear, AvailableCopies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '978-0743273565', 1925, 3),
('To Kill a Mockingbird', 'Harper Lee', '978-0060935467', 1960, 5),
('1984', 'George Orwell', '978-0451524935', 1949, 2),
('Pride and Prejudice', 'Jane Austen', '978-0141439518', 1813, 4),
('The Catcher in the Rye', 'J.D. Salinger', '978-0316769488', 1951, 6),
('The Hobbit', 'J.R.R. Tolkien', '978-0547928227', 1937, 7),
('Fahrenheit 451', 'Ray Bradbury', '978-1451673319', 1953, 3),
('Moby-Dick', 'Herman Melville', '978-1503280786', 1851, 2),
('War and Peace', 'Leo Tolstoy', '978-1400079988', 1869, 1),
('The Odyssey', 'Homer', '978-0140268867', -800, 4);

-- Insert sample data into Members (at least 5 members)
INSERT INTO Members (FirstName, LastName, Email, JoinDate, IsActive) VALUES
('John', 'Doe', 'john.doe@example.com', '2023-01-15', TRUE),
('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20', TRUE),
('Alice', 'Johnson', 'alice.johnson@example.com', '2023-03-05', TRUE),
('Bob', 'Brown', 'bob.brown@example.com', '2023-04-10', TRUE),
('Charlie', 'Davis', 'charlie.davis@example.com', '2023-05-12', TRUE);

-- Update book availability when a book is borrowed (Example: Borrowing '1984')
UPDATE Books
SET AvailableCopies = AvailableCopies - 1
WHERE ISBN = '978-0451524935';

-- Practice constraints: Soft delete by deactivating a member instead of deleting them
UPDATE Members
SET IsActive = FALSE
WHERE Email = 'charlie.davis@example.com';
