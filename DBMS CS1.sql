
create database srinu;

use srinu;

create table employees(id int,name varchar(20),age int, salary double);



alter table employees add column Email varchar(30);
select * from employees;

alter table employees rename column age to years_of_experience;
select * from employees;

alter table employees drop column salary;
select * from employees;



create table departments(id varchar(20), name varchar(20));
select * from departments;

alter table employees add constraint pk_employees primary key(id);
select * from employees;

alter table employees add constraint unique_email unique(Email);

alter table employees rename column years_of_experience to age;

alter table employees add constraint check_key check(age>=18);

#alter table employees drop constraint check_key;



alter table departments add constraint pri_key primary key (department_id);

desc departments;
describe departments;

alter table employees modify email varchar(20) Not NULL;

desc employees;



alter table employees add constraint fk_key foreign key(department_id) references departments(department_id);

select * from employees;


-- alter table departments rename column id to department_id;
-- alter table employess drop foreign key foreign_key;

#alter table employees drop check check_key;


















