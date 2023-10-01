use srinu;

create table customer(customer_id varchar(10), customer_name varchar(20), email varchar(30),phone_number int);

alter table customer add column address varchar(30); 

alter table customer rename column phone_number to contact_number;

alter table customer drop column email;

create table orders(order_id varchar(10), ordered_customer_id varchar(10), product_name varchar(20), order_date date);

alter table customer add constraint pk_id primary key(customer_id);

