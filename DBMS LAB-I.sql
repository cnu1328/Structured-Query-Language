use dbmslab;

-- 1. Create a table called "employees" with columns for "id", "name", "age", and "salary".
create table empolyeesl1(id int, 
						emp_name varchar(20), 
                        age int, 
                        salary double,
                        primary key(id));

alter table empolyeesl1 rename employeesl1;
--  2. Add a column called "email" to the "employees" table.
alter table employeesl1 add column email varchar(20);

select * from employeesl1;

-- 3. Rename the "age" column in the "employees" table to "years_of_experience". 
 
alter table employeesl1 rename column age to years_of_experience;

-- 4. Delete the "salary" column from the "employees" table.
alter table employeesl1 drop column salary; 

-- 5. Create a table called "departments" with columns for "id" and "name". 
create table departmentsl1(id int, name varchar(20) not null);

-- 6. Add a primary key constraint to the "id" column in the "employees" table. 
alter table departmentsl1 add constraint primary key(id); 
                           
-- 7. Add a foreign key constraint to the "department_id" column in the "employees" table,
-- referencing the "id" column in the "departments" table.
alter table employeesl1
	add column department_id varchar(5);
    
alter table employeesl1
	modify column department_id int;

select * from employeesl1;

alter table employeesl1
	add constraint fk_key 
    foreign key (department_id) 
    references departmentsl1 (id);
 
-- 8. Add a unique constraint to the "email" column in the "employees" table.  
alter table employeesl1
	add constraint unique(email);

-- 9. Drop the "employees" table.

drop table employeesl1;

-- 10. Truncate the "departments" table to delete all data, but keep the table structure intact.

truncate table departmentsl1; 
drop table departmentsl1;

select * from departmentsl1;

show tables;

-- show databases;

-- CASE STUDY-II

 -- 1. Create a table called "customers" with columns for "id", "name", "email", and
-- "phone_number". 

create table customersl1(id int,
						 name varchar(20) not null,
                         email varchar(20) not null,
                         phone_number varchar(13) not null);
                         
-- 2. Add a column called "address" to the "customers" table.

alter table customersl1 add column address varchar(30); 

-- 3. Rename the "phone_number" column in the "customers" table to "contact_number".

alter table customersl1 rename column phone_number to contact_number; 

select * from customersl1;

--  4. Delete the "email" column from the "customers" table.

alter table customersl1 drop column email;

-- 5. Create a table called "orders" with columns for "id", "customer_id", "product_name", and
-- "order_date". 

create table ordersl1(id int,
					  customer_id int,
					  product_name varchar(10),
                      order_date date);
                      
-- 6. Add a primary key constraint to the "id" column in the "customers" table.

alter table customersl1 add constraint primary key(id);

-- 7. Add a foreign key constraint to the "customer_id" column in the "orders" table, referencing
-- the "id" column in the "customers" table. 

alter table ordersl1 add constraint fk_key foreign key(customer_id) references customersl1(id);

-- 8. Add a unique constraint to the "name" column in the "customers" table

alter table customersl1 add constraint unique(name); 

-- 9. Drop the "orders" table 

drop table ordersl1;

select * from ordersl1;

-- 10. Truncate the "customers" table to delete all data, but keep the table structure intact

truncate table customersl1;

drop table customersl1;

 
-- 11. Create a table called "suppliers" with columns for "id", "name", "address", and
-- "contact_number".
-- 12. Add a column called "email" to the "suppliers" table.
-- 13. Rename the "address" column in the "suppliers" table to "location".
-- 14. Add a primary key constraint to the "id" column in the "suppliers" table.
-- 15. Add a unique constraint to the "name" column in the "suppliers" table.

create table suppliers(id int,
					   name varchar(15),
                       address varchar(30),
                       contact_number varchar(13));

alter table suppliers add column email varchar(20);

alter table suppliers rename column address to location;

alter table suppliers add constraint pk_key primary key (id);

alter table suppliers add constraint unique_name unique (name);

select * from suppliers;

drop table suppliers;
                        

-- CASE STUDY - III

-- 1. Create a table called "invoices" with columns for "id", "customer_id", "amount", and 
-- "due_date".

create table invoices(id int,
					  customer_id int,
					  amount real,
                      due_date date);
                      


-- 2. Add a column called "paid_date" to the "invoices" table.
alter table invoices add column paid_date date;

-- 3. Rename the "amount" column in the "invoices" table to "invoice_amount"
alter table invoices rename column amount to invoice_amount;

-- 4. Delete the "due_date" column from the "invoices" table.
alter table invoices drop column due_date; 

-- 5. Create a table called "payments" with columns for "id", "invoice_id", "amount", and 
-- "payment_date". 

create table payments(id int,
					  invoice_id int,
                      amount real,
                      payment_date date);

-- 6. Add a primary key constraint to the "id" column in the "invoices" table.
alter table invoices add constraint pk_key primary key (id);

-- 7. Add a foreign key constraint to the "customer_id" column in the "invoices" table, 
-- referencing the "id" column in the "customers" table.

create table customers1(customer_id int,
						customer_name varchar(20) not null,
						salary real);
                        
alter table customers1 add constraint pk_key primary key (customer_id);

alter table invoices 
	add constraint fk_key
    foreign key (customer_id)
    references customers1(customer_id);
    
-- 8. Add a unique constraint to the "id" column in the "invoices" table.
alter table invoices add constraint unique_key unique (id); 

-- 9. Add a foreign key constraint to the "invoice_id" column in the "payments" table, referencing
-- the "id" column in the "invoices" table
alter table payments 
	add constraint payment_fk
    foreign key (invoice_id)
    references invoices (id);
    
-- 10.Add a check constraint to the "amount" column in the "invoices" table to ensure that it is 
-- greater than zero.
alter table invoices 
	add constraint check_g_zero 
    check (invoice_amount > 0);
    
-- 11.Add a default value of "CURRENT_TIMESTAMP" to the "paid_date" column in the 
-- "invoices" table
alter table invoices
	modify column paid_date
    timestamp default CURRENT_TIMESTAMP;

-- 12.Drop the "payments" table.
drop table payments;

-- 13.Truncate the "invoices" table to delete all data, but keep the table structure intact.
truncate table invoices;

-- 14.Create an index on the "customer_id" column in the "invoices" table.
create index index_customer_id on invoices (customer_id);

-- 15.Add a NOT NULL constraint to the "customer_id" column in the "invoices" table 
alter table invoices
	modify column customer_id int not null;

-- 16.Drop the primary key constraint from the "invoices" table.
alter table invoices
	drop primary key;

--  17.Drop the foreign key constraint from the "customer_id" column in the "invoices" table.
alter table invoices
	drop foreign key fk_key;
    
-- 18.Drop the unique constraint from the "id" column in the "invoices" table.
alter table invoices 
	drop constraint check_g_zero;

-- 19.Drop the foreign key constraint from the "invoice_id" column in the "payments" table.
 alter table payments
	drop foreign key payment_fk;
    
--  20.Drop the check constraint from the "amount" column in the "invoices" table.
alter table invoices
	drop constraint unique_key;
 
    
    
select * from invoices;
select * from payments;




