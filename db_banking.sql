show databases;

drop database demo;
create database BankingDB;
use BankingDB;

CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE customers
ADD DateOfBrith DATE;

select * from customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

ALTER TABLE Accounts
ADD PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD PRIMARY KEY (TransactionID);

ALTER TABLE Branches
ADD PRIMARY KEY (BranchID);

ALTER TABLE Loans
ADD PRIMARY KEY (LoanID);

ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

ALTER TABLE Loans
ADD CustomerID INT;

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


