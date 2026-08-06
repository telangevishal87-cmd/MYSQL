create database test1;

use test1;

create table table1 (
User_id tinyint primary key,
full_name varchar(50) not null,
Age tinyint,
city varchar(23) not null 
);

alter table table1
add constraint applying_for_age check ( Age > 18 );

create table table2 (
product_id tinyint primary key,
product_name varchar(100) not null,
product_price int,
User_id tinyint references table1(User_id)
);