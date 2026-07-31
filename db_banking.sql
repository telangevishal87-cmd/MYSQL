create database practice3;

use practice3;

create table practice3_table(
customer_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique not null,
phone_number varchar(20)
);

select*from practice3_table;

insert into practice3_table (customer_id,first_name,last_name,email,phone_number)
value ( 1001,"vishal","telange","telangevishal05@gmail.com","9823465698"),
(1002,"ashok","padature","ashokpadature89@gmail.com","8723457609"),
(1003,"dipak","giri","dipakgiri65@gmail.com","9503123670");

select * from practice3_table;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

select * from Accounts;
select AccountID from Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);
select * from Transactions;
CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

select * from Branches;
 
 ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

 


