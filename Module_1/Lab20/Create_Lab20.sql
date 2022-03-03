create database lab_mysql;
use lab_mysql;

create table cars (car_id integer primary key, VIN char(17), OEM varchar(15), model varchar(15), year Integer, color varchar(15));
create table sales (staff_id integer primary key, name varchar(15), store_id varchar(20));
create table customers (cust_id integer primary key, name varchar(15), phone bigint, email varchar(30), adress varchar(50), city varchar(10), state varchar(15), country char(3), postal integer);
create table invoices (invoice_id varchar(15) primary key, inv_date date, car_id integer, cust_id integer, sales_name varchar(15));

select * from cars;
select * from sales;
select * from customers;
select * from invoices;

