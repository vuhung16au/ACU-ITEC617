# Library Management System Schema Overview

This example uses a simple Library database to practice DDL (Data Definition Language) and basic DML (Data Manipulation Language).

## Tables

### 1. Books
Stores information about the books available in the library.
*   **BookID**: Primary Key, uniquely identifies each book.
*   **Title**: The title of the book.
*   **Author**: The author of the book.
*   **ISBN**: Unique identifier for the book, restricted by a UNIQUE constraint.
*   **PublishedYear**: The year the book was published.
*   **AvailableCopies**: The number of copies currently available for borrowing.

### 2. Members
Stores information about the library members.
*   **MemberID**: Primary Key, uniquely identifies each member.
*   **FirstName**: Member's first name.
*   **LastName**: Member's last name.
*   **Email**: Member's email address.
*   **JoinDate**: The date the member joined the library.
*   **IsActive**: A boolean flag indicating if the member is currently active (used to practice "soft delete" by deactivating a member instead of deleting their record).
