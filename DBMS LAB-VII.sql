use srinu;

create table department(department_id integer,
						department_name varchar(10) not null,
                        location varchar(20) not null,
                        manager_id integer,
                        primary key(department_id));

create table employ(employee_id integer,
					  employee_name varchar(20) not null,
                      department_id integer,
                      salary decimal not null,
                      primary key(employee_id),
                      foreign key(department_id) references department(department_id));

insert into department values( 1, "IT" , "New York" , 2 ),
							( 2 , "Sales" , "Chicago" , 3 ),
							( 3 , "HR" , "Boston" , 7 ),
							( 4 , "Marketing" , "Chicago" , 8);

insert into employ values(1, 'John', 1, 5000 ),
						( 2 , "Sarah", 1 , 4500),
						( 3 , "Michael",  2 , 6000),
						( 4 , "Emily" , 2 , 5500),
						( 5 , "David",  3 , 4000),
						( 6 , "Jessica" , 3 , 4200),
						( 7 , "Brian" , 3 , 4800),
						( 8 , "Olivia" , 4, 5500);

select * from employ;
select * from department;

-- 1. What is the average salary of employees in each department? 
select department_name, round(avg(salary), 2) from employ
join department on department.department_id = employ.department_id group by employ.department_id;

-- 2.  Who is the highest-paid employee in the Sales department?
select employee_id, employee_name, salary from employ
inner join department on department.department_id = employ.department_id
where salary = (select max(salary) from employ group by department.department_name = 'sales' );

-- 3.   How many employees have a salary higher than the average salary in their department?
select count(*) from employ 
where salary > (select avg(salary) from employ where department_id = employ.department_id);

--  4. Which department has the highest average salary? 
select department_id, avg(salary) as avg_salary from employ
group by department_id order by avg_salary desc limit 1;

-- 5. What is the total salary expense for each department?
 select department_id, sum(salary) from employ group by department_id; 

-- 6. Who is the manager of the HR department?
select employee_name from employ 
join department on employ.employee_id = department.manager_id
where department_name = "HR";

-- 7.  How many employees are there in the Marketing department?
select count(*) from employ
join department on department.department_id = employ.department_id
where department_name = 'marketing';

--  8. What is the average salary of employees supervised by Sarah?
select avg(salary) from employ
join department on employ.department_id = department.department_id
where employee_name = 'sarah';

-- 9. What is the location of the IT department
select location from department where department_name = "IT";

-- 10. Which employees have a salary higher than their department's average salary 
select employee_id, employee_name, department_name, salary from employ
join department on employ.department_id = department.department_id
where salary > (select avg(salary) from employ group by department_id = employ.department_id);