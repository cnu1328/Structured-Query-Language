

use dbmslab;

-- 1. Write a SQL query to insert a new record into the 'employees' table, with employee
-- name, employee ID, and salary 

create table employees(emp_id varchar(10),
					   emp_name varchar(20),
                       salary double);

insert into employees values("B191328","Srinivas",10000.00);
insert into employees values("B192415","Shiva Tarak",1000000.00);
insert into employees values("B192727","Anil",10000.00);
insert into employees values("B191418","Vishnu Vhardhan",1000000.00);
insert into employees values("B191654","shiva maharaj",10000.00);
insert into employees values("B192416","Shiva Tarak",1000000.00);
-- 2. Write a SQL query to update the salary for a specific employee in the 'employees'
-- table 

update employees set salary=1000000 where emp_id="B191328";
update employees set salary=49999 where emp_id="B191328";

-- 3. Write a SQL query to delete a specific record from the 'employees' table. 

delete from employees where emp_id="b191654";

-- 4. Write a SQL query to retrieve the names and employee IDs of all employees in the
-- 'employees' table.

select emp_name, emp_id from employees;

-- 5. Write a SQL query to retrieve the names and salaries of all employees who earn more
-- than $50,000 in the 'employees' table. 

select emp_name, salary from employe where salary>50000;

-- 6. Write a SQL query to retrieve the names and salaries of all employees who earn
-- between $40,000 and $50,000 in the 'employees' table.

select emp_name, salary from employe where salary>40000 and salary<50000;
select emp_name, salary from employe where salary between 40000 and 50000;

-- 7. Write a SQL query to retrieve the names and employee IDs of all employees who
-- have not been assigned any project in the 'employees' table.

create table project(pro_id int, emp_id varchar(20));

insert into project values(111,"B191328");
insert into project values(112,"B192415");

select emp_name, emp_id from employees where emp_id NOT IN(select emp_id from project);

-- 8. Write a SQL query to retrieve the names and salaries of all employees in descending
-- order of their salaries in the 'employees' table.

select emp_name, salary from employees order by salary;#ascending order

select emp_name, salary from employe order by salary desc;

-- 9. Write a SQL query to retrieve the names and employee IDs of all employees in
-- ascending order of their employee IDs in the 'employees' table.

select emp_name, emp_id from employe order by emp_id;

select * from employe;

-- 1. Write a SQL query to insert a new record into the 'customers' table, with customer
-- name, email, and phone number


create table customers(cus_name varchar(20), email varchar(30), phone double, age int);
 
 insert into customers values("Srinivas", "srinudarpally@gmail.com",9640735283,15);
insert into customers values("shiva Tarak", "shiva@gmail.com",9640735283,20);
insert into customers values("Anil", "anil@gmail.com",9640735283,25);
insert into customers values("Karthik", "karthik@gmail.com",9640735283,45);

select * from customers;

-- 2. Write a SQL query to update the email address for a specific customer in the
-- 'customers' table.

update customers set email = "shivatarak@gmail.com" where cus_name="shiva Tarak";

select * from customers;
-- 3. Write a SQL query to delete a specific record from the 'customers' table.
delete from customers where cus_name="karthik";
-- 4. Write a SQL query to retrieve the names and phone numbers of all customers in
-- the 'customers' table.
select cus_name, phone from customers;

-- 5. Write a SQL query to retrieve the names and email addresses of all customers
-- whose email addresses end with '@gmail.com' in the 'customers' table.

select cus_name, email from customers where email like "%@gmail.com";

-- 6. Write a SQL query to retrieve the names and phone numbers of all customers
-- whose phone numbers start with '555' in the 'customers' table.

select cus_name, phone from customers where phone like "%555";

-- 7. Write a SQL query to retrieve the names and email addresses of all customers in
-- alphabetical order of their names in the 'customers' table.


select cus_name, phone from customers order by cus_name;

-- 8. Write a SQL query to retrieve the names and phone numbers of all customers in
-- reverse alphabetical order of their names in the 'customers' table.

select cus_name, phone from customers order by cus_name desc;

-- 9. Write a SQL query to insert a new record into the 'orders' table, with order number,
-- customer ID, and order date.

create table orders(order_num int, cus_id varchar(10), order_date date);

insert into orders values(111,"C13289","2002-4-20");


-- Experiment 3

-- 1. Write a query to insert a new row into the "customers" table with specific values
-- for name, email, and phone number.

-- 2. Write a query to update the phone number for a specific customer in the
-- "customers" table.

update customers set phone=9502604669 where cus_name="anil";

-- 3. Write a query to delete a specific customer from the "customers" table. 

delete from customers where cus_name="anil";


-- 4. Write a query to retrieve all columns and rows from the "customers" table.
select * from customers;
-- 5. Write a query to retrieve the name and email columns from the "customers" table
select cus_name, email from customers;

-- 6. Write a query to retrieve customers who have an email address ending in
-- "@gmail.com". 
select * from customers where email like "%@gmail.com";

-- 7. Write a query to retrieve customers whose phone number is between 9988776600
-- and 9988776655. 

select cus_name from customers where phone between 9988776600 and 9988776655;
-- 8. Write a query to retrieve the maximum age from the "customers" table. 
select max(age) from customers;

-- 9. Write a query to retrieve the minimum age from the "customers" table.
 
select min(age) from customers;
-- 10. Write a query to retrieve the average age of customers from the "customers"
-- table

select avg(age) from customers;

-- 11. Write a query to retrieve the total number of customers in the "customers" table

select count(*) from customers;

-- 12. Write a query to insert multiple records into the "customers" table at once. 

select * from customers;

insert into customers values("mahesh","mahesh@gmail.com",95392382,56),("babul","babul@gamil.com",9342379283,57);

alter table customers add column city varchar(20);

update customers set city="Nizamabad" where cus_name="Srinivas";
update customers set city="Jagityal" where cus_name="shiva tarak";
update customers set city="medak" where cus_name="anil";
update customers set city="jagityal" where cus_name="vishnu";
update customers set city="karinagar" where cus_name="babul";

-- 13. Write a query to update the email addresses of all customers who live in a
-- specific city

update customers set email="yagityal@gmail.com" where city="yagityal";

select * from customers;

-- 14. Write a query to create a new table named "orders" with columns for order ID,
-- customer ID, and order date. 