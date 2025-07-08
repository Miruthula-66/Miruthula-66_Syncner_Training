CREATE DATABASE BankDB;
GO
USE BankDB;
GO
DROP TABLE IF EXISTS Loan, [Transaction], Account, Customer, Employee, Branch;
GO
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(255),
    IFSC_Code VARCHAR(20) UNIQUE
);
GO
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Designation VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
GO
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);
GO

CREATE TABLE Account (
    AccountNumber INT PRIMARY KEY,
    AccountType VARCHAR(20),
    Balance DECIMAL(15, 2),
    DateOpened DATE,
    CustomerID INT,
    BranchID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
GO

CREATE TABLE [Transaction] (
    TransactionID INT PRIMARY KEY,
    TransactionDate DATE,
    TransactionType VARCHAR(10),
    Amount DECIMAL(15, 2),
    AccountNumber INT,
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);
GO
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    LoanType VARCHAR(50),
    Amount DECIMAL(15, 2),
    InterestRate DECIMAL(5, 2),
    Duration INT,
    CustomerID INT,
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO
INSERT INTO Branch VALUES
(1, 'Main Branch', '123 Bank St, Delhi', 'IFSC0001'),
(2, 'West Branch', '456 Market Rd, Mumbai', 'IFSC0002');
GO

INSERT INTO Employee VALUES
(101, 'Amit Sharma', 'Manager', 80000, '2020-01-15', 1),
(102, 'Priya Rao', 'Clerk', 40000, '2021-03-10', 2);
GO
INSERT INTO Customer VALUES
(201, 'Rahul Verma', '1990-07-12', '12 Green Ave, Delhi', '9876543210', 'rahul@example.com'),
(202, 'Anjali Singh', '1988-05-25', '34 Blue Rd, Mumbai', '9123456789', 'anjali@example.com');
GO
INSERT INTO Account VALUES
(301, 'Savings', 25000.00, '2023-04-01', 201, 1),
(302, 'Current', 120000.00, '2022-11-10', 202, 2);
GO
INSERT INTO [Transaction] VALUES
(401, '2025-04-10', 'Credit', 5000.00, 301),
(402, '2025-04-11', 'Debit', 2000.00, 301);
GO
INSERT INTO Loan VALUES
(501, 'Home Loan', 500000.00, 8.5, 120, 201, 101),
(502, 'Car Loan', 300000.00, 9.0, 60, 202, 102);
GO
SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM [Transaction];
SELECT * FROM Loan;
