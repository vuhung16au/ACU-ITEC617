-- DDL: Create Tables

CREATE TABLE "Books" (
    "BookID" SERIAL PRIMARY KEY,
    "Title" VARCHAR(255) NOT NULL,
    "Author" VARCHAR(255) NOT NULL,
    "PublicationYear" INT,
    "Genre" VARCHAR(100)
);

CREATE TABLE "Members" (
    "MemberID" SERIAL PRIMARY KEY,
    "FirstName" VARCHAR(100) NOT NULL,
    "LastName" VARCHAR(100) NOT NULL,
    "JoinDate" DATE NOT NULL
);

CREATE TABLE "Loans" (
    "LoanID" SERIAL PRIMARY KEY,
    "BookID" INT NOT NULL,
    "MemberID" INT NOT NULL,
    "LoanDate" DATE NOT NULL,
    "ReturnDate" DATE,
    FOREIGN KEY ("BookID") REFERENCES "Books"("BookID"),
    FOREIGN KEY ("MemberID") REFERENCES "Members"("MemberID")
);

-- DML: Insert Sample Data

INSERT INTO "Books" ("Title", "Author", "PublicationYear", "Genre") VALUES
('The Lord of the Rings', 'J.R.R. Tolkien', 1954, 'Fantasy'),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', 1979, 'Science Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Southern Gothic');

INSERT INTO "Members" ("FirstName", "LastName", "JoinDate") VALUES
('Alice', 'Smith', '2023-01-15'),
('Bob', 'Johnson', '2023-03-22'),
('Charlie', 'Brown', '2023-05-10');

INSERT INTO "Loans" ("BookID", "MemberID", "LoanDate", "ReturnDate") VALUES
(1, 1, '2023-06-01', '2023-06-15'),
(3, 2, '2023-07-10', NULL), -- Book not yet returned
(2, 1, '2023-08-05', '2023-08-20'),
(4, 3, '2023-09-12', NULL),
(5, 2, '2023-10-01', '2023-10-14');
