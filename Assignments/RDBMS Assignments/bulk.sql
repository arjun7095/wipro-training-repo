-- **INSERT Statements**

-- Adding new books to the library
INSERT INTO Books (BookID, Title, Author, Category, PublishedYear, CopiesAvailable)
VALUES
(101, '1984', 'George Orwell', 'Fiction', 1949, 5),
(102, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
(103, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 2);

-- Adding new members to the library
INSERT INTO Members (MemberID, FirstName, LastName, MembershipDate, MembershipType)
VALUES
(1, 'Alice', 'Smith', '2023-01-15', 'Regular'),
(2, 'Bob', 'Johnson', '2023-02-10', 'Premium'),
(3, 'Charlie', 'Brown', '2023-03-05', 'Regular');

-- **UPDATE Statements**

-- Updating the number of available copies for a book
UPDATE Books
SET CopiesAvailable = 7
WHERE BookID = 101;

-- Updating a member's membership type
UPDATE Members
SET MembershipType = 'Premium'
WHERE MemberID = 1;

-- **DELETE Statements**

-- Deleting a book based on specific criteria (e.g., books published before 1950)
DELETE FROM Books
WHERE PublishedYear < 1950;

-- Deleting a member who hasn’t borrowed any books
DELETE FROM Members
WHERE MemberID NOT IN (SELECT DISTINCT MemberID FROM BorrowedBooks);

-- **BULK INSERT Operations**

-- Loading data from an external source into the Books table
-- Assumes a CSV file named 'books.csv' exists
BULK INSERT Books
FROM 'C:\data\books.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip the header row
);

-- **Borrowing a book**
INSERT INTO BorrowedBooks (TransactionID, MemberID, BookID, BorrowDate, ReturnDate)
VALUES
(1001, 1, 102, '2023-10-10', NULL); -- Book not yet returned

-- **Returning a book**
UPDATE BorrowedBooks
SET ReturnDate = '2023-10-20'
WHERE TransactionID = 1001;

-- **Combining Operations**

-- Start a transaction to check availability before borrowing a book
BEGIN TRANSACTION;

-- Check if copies are available
IF (SELECT CopiesAvailable FROM Books WHERE BookID = 102) > 0
BEGIN
    -- Reduce the number of copies
    UPDATE Books
    SET CopiesAvailable = CopiesAvailable - 1
    WHERE BookID = 102;

    -- Add an entry in BorrowedBooks
    INSERT INTO BorrowedBooks (TransactionID, MemberID, BookID, BorrowDate, ReturnDate)
    VALUES (1002, 2, 102, '2023-10-15', NULL);
END
ELSE
    PRINT 'No copies available';

-- Commit the transaction
COMMIT;
