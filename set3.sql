use dbmslab;
drop  table if exists employee;
create table employee(employee_id integer,
					  first_name varchar(20) not null,
                      last_name varchar(20) not null,
                      department varchar(20) not null,
                      hire_date date not null,
                      primary key(employee_id));

insert into employee values(1, "John", "Smith", "IT", "2022-03-15"),
							(2, "Jane", "Johnson", "HR", "2021-06-20"),
							(3, "Michael", "Brown", "Marketing", "2023-01-10"),
							(4, "Emily", "Davis", "Finance", "2020-09-05"),
							(5, "David", "Lee", "IT", "2023-05-02");

create table projects(project_id integer,
					  project_name varchar(20) not null, 
                      start_date date not null,
                      end_date date not null,
                      primary key(project_id));
                      
insert into projects values(101, "Project A", "2023-03-01", "2023-06-30"),
							(102, "Project B", "2023-05-15", "2023-08-31"),
							(103, "Project C", "2022-11-20", "2023-01-31"),
							(104, "Project D", "2023-04-10", "2023-09-30"),
							(105, "Project E", "2023-02-15", "2023-05-31");
                            
create table assignments(employee_id integer,
						 project_id  integer, 
                         hours_worked int,
                         foreign key(employee_id) references employee(employee_id),
                         foreign key(project_id) references projects(project_id));
                         
insert into assignments values(1, 101, 120),
								(2, 101, 90),
								(1, 102, 80),
								(3, 103, 40),
								(5, 101, 100);
                                
-- Retrieve the names of all employees in alphabetical order. 

select first_name, last_name from employee order by first_name, last_name;

--   Retrieve the average number of hours worked on projects.

select avg(hours_worked) from assignments;

--  Retrieve the project names and the number of employees assigned to each
 -- project
 
 select project_name, count(*) from projects
 join assignments
 on assignments.project_id = projects.project_id
 group by projects.project_id;
 
 -- Retrieve the names of employees who have worked on more than one
 -- project 
 
 select first_name, last_name from employee
 join assignments
 on assignments.employee_id = employee.employee_id
 group by assignments.employee_id having count(assignments.employee_id) > 1;
 
 -- Retrieve the project names and the total number of hours worked on each
 -- project. 
 
 select project_name, sum(hours_worked) from projects
 join assignments
 on assignments.project_id = projects.project_id
 group by assignments.project_id;
 
 -- Retrieve the average age of employees in each department 
 select department, avg(datediff(curdate(), hire_date)/365) from employee group by department;
 
 -- Retrieve the names of employees who have been hired before the year
 -- 2022. 
 select first_name, last_name from employee where year(hire_date) < 2022;
 
 
 -- Retrieve the names of employees who have worked on a project with more
 -- than 100 hours 
 
 select first_name, last_name from employee
 join assignments
 on employee.employee_id = assignments.employee_id
 where hours_worked > 100;
 