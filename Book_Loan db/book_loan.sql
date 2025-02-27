-- Creating the database
CREATE DATABASE Library;

-- Using the database
USE Library;

-- Creating the Books table with ISBN VARCHAR(50)
CREATE TABLE Books (
    ISBN VARCHAR(50) PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Quantity INT
);

-- Creating the Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Creating the Loans table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    ISBN VARCHAR(50),
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);

-- Inserting records into Books with consistent ISBNs
INSERT INTO Books (ISBN, Title, Author, Genre, Quantity)
VALUES
    ('978-1783322432', 'Database Management Systems', 'Vidhya V., Jeyaram G., Ishwarya K.', 'Database', 4),
    ('978-0078022159', 'Database System Concepts', 'Abraham Silberschatz, Henry F. Korth, S. Sudarshan', 'Database', 6),
    ('978-0133970777', 'Fundamentals of Database Systems', 'Ramez Elmasri, Shamkant B. Navathe', 'Database', 5);

-- Inserting records into Members with updated emails
INSERT INTO Members (MemberID, Name, Email, Phone)
VALUES
    (1, 'Daniel Endale', 'daniel.endale@programmer.com', '1000000001'),
    (2, 'Stev Jobs', 'stevjobs@inventor.com', '1000000002'),
    (3, 'Albert Enistian', 'albert.enistian@theoreticalphysicist.com', '1000000003');

-- Inserting records into Loans with matching ISBNs to those in the Books table
INSERT INTO Loans (MemberID, ISBN, LoanDate, ReturnDate)
VALUES
    (1, '978-1783322432', '2025-02-27', '2025-03-13'),  -- ISBN matches first book
    (2, '978-0078022159', '2025-02-27', '2025-03-12'),  -- ISBN matches second book
    (3, '978-0133970777', '2025-02-27', '2025-03-14');  -- ISBN matches third book

-- Query to retrieve all books borrowed by a specific member (e.g., MemberID = 1)
SELECT b.Title, b.Author, l.LoanDate, l.ReturnDate
FROM Loans l
JOIN Books b ON l.ISBN = b.ISBN
WHERE l.MemberID = 1;

-- Updating the quantity of a specific book (e.g., ISBN = '978-0132350884')
UPDATE Books
SET Quantity = Quantity + 1
WHERE ISBN = '978-1783322432';  -- ISBN of the book to update

-- Deleting a member record (e.g., MemberID = 2)
DELETE FROM Members
WHERE MemberID = 2;
