# Library Database Schema Overview

This example focuses on basic DDL (`CREATE`, `ALTER`, `DROP`) and DML (`INSERT`) using a simplified library database.

## Tables

### 1. `Books`
Stores information about the books available in the library.
*   `BookID`: Primary key.
*   `Title`: The title of the book.
*   `Author`: The author of the book.
*   `PublicationYear`: The year the book was published.
*   `Genre`: The genre of the book.
*   `ISBN`: The International Standard Book Number (added via `ALTER TABLE` in a later step).

### 2. `Members`
Stores information about library members.
*   `MemberID`: Primary key.
*   `FirstName`: The member's first name.
*   `LastName`: The member's last name.
*   `JoinDate`: The date the member joined the library.

### 3. `Loans`
Tracks which books are currently or were previously borrowed by members.
*   `LoanID`: Primary key.
*   `BookID`: Foreign key referencing the `Books` table.
*   `MemberID`: Foreign key referencing the `Members` table.
*   `LoanDate`: The date the book was borrowed.
*   `ReturnDate`: The date the book was returned (nullable if still borrowed).
