-- first command
create database banking_DB1;
-- 2nd command
use  banking_DB1;
-- 3rd command
create table Account_holder_Date(
Account_holder_name  varchar (100) not null,
Account_number int not null,
Email varchar(200),
Age tinyint not null
);

select * from Account_holder_Date;


