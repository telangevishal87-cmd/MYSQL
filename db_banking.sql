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
alter table customers
add column DateOfBirth varchar(50);

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
INSERT INTO Accounts
(AccountID, AccountType, Balance)
VALUES
(101, 'Savings', 25000.00),
(102, 'Current', 50000.00),
(103, 'Savings', 35000.00),
(104, 'Current', 75000.00),
(105, 'Savings', 45000.00),
(106, 'Salary', 60000.00),
(107, 'Savings', 55000.00),
(108, 'Current', 90000.00),
(109, 'Salary', 40000.00),
(110, 'Savings', 70000.00);
select * from accounts;
CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);
INSERT INTO Transactions
(TransactionID, TransactionDate, Amount, TransactionType)
VALUES
(1, '2024-01-05', 5000.00, 'Deposit'),
(2, '2024-01-10', 1500.00, 'Withdrawal'),
(3, '2024-01-15', 2500.00, 'Deposit'),
(4, '2024-02-03', 1000.00, 'Withdrawal'),
(5, '2024-02-10', 7500.00, 'Deposit'),
(6, '2024-02-18', 2000.00, 'Transfer'),
(7, '2024-03-05', 3500.00, 'Deposit'),
(8, '2024-03-12', 1200.00, 'Withdrawal'),
(9, '2024-03-20', 4500.00, 'Transfer'),
(10, '2024-04-01', 8000.00, 'Deposit'),
(11, '2024-04-10', 1800.00, 'Withdrawal'),
(12, '2024-04-22', 3000.00, 'Transfer'),
(13, '2024-05-05', 6000.00, 'Deposit');

select * from Transactions;
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

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(101, 50000.00, 7.50, '2024-01-15', '2027-01-15'),
(102, 75000.00, 8.25, '2024-03-10', '2028-03-10'),
(103, 100000.00, 9.00, '2024-05-20', '2029-05-20'),
(104, 45000.00, 7.75, '2024-07-01', '2026-07-01'),
(105, 120000.00, 8.50, '2024-09-15', '2030-09-15'),
(106, 65000.00, 7.25, '2025-01-10', '2028-01-10'),
(107, 90000.00, 8.75, '2025-02-25', '2029-02-25'),
(108, 55000.00, 7.90, '2025-04-05', '2027-04-05'),
(109, 150000.00, 9.25, '2025-06-18', '2030-06-18'),
(110, 80000.00, 8.00, '2025-08-22', '2028-08-22');

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


INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBrith )
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

select * from Customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SET SQL_SAFE_UPDATES= 0;

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Transactions
WHERE TransactionID = 302;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;


SELECT * FROM Customers;
  
  SELECT FirstName, LastName, Email, Phone
FROM Customers;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

select * from customers;

SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

SELECT
FirstName,
LOWER(FirstName) AS LowerCaseName
FROM customers;

SELECT
FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;

SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

SELECT ROUND(1256.75) AS Rounded_Value;

SELECT CEIL(1256.25) AS Ceiling_Value;

SELECT FLOOR(1256.75) AS Floor_Value;

SELECT ABS(-2500) AS Absolute_Value;

SELECT MOD(25,4) AS Remainder;

select * from customers;

SELECT CURDATE(); 

SELECT NOW();

SELECT
CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

SELECT
CustomerID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;

SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

SELECT
    FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;

SELECT SUM(Balance) as total_balance
FROM Accounts;

SELECT AVG(Balance) AS average_balance
FROM Accounts;

SELECT MAX(Balance) AS highest_balance
FROM Accounts;

SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType

Window_Function() OVER (
    ORDER BY column_name
);


Select
    LoanID,
    CustomerID, LoanAmount, RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS LoanRank
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    DENSE_RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS DenseRank
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        ORDER BY LoanAmount DESC
    ) AS RowNumber
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY LoanAmount DESC
    ) AS RowNum
FROM Loans;

SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;

