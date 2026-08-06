create database project;
use project;

create table customers (
customer_id int primary key,
customer_name varchar(100) not null,
email varchar (100) unique,
phone varchar (15)
);

create table products(
product_id int primary key,
product_name varchar(100) not null,
price decimal(10,2),
stock_quantity int
);

create table orders(
order_id int primary key,
customer_id int,
order_date Date,
total_amount decimal(10,2),

foreign key (customer_id)
references customers(customer_id)
);

create table order_details(
order_detail_id int primary key,
order_id int,
product_id int,
quantity int,
subtotal Decimal(10,2),

foreign key (order_id)
references orders(order_id),

foreign key (product_id)
references products(product_id)
);

create table payments (
payment_id int primary key,
order_id int,
payment_date Date,
payment_method varchar(50),
payment_amount Decimal(10,2),

foreign key (order_id)
references orders(order_id)
);
