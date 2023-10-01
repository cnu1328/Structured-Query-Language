use srinu;
create table products(product_id integer,
					  name varchar(20),
					  price decimal,
                      category varchar(20),
                      rating integer,
					  primary key(product_id));
    
insert into products values(1,"Apple iPhone", 799.00, "Electronics",4),
							(2,"Samsung Galaxy S21", 899.00, "Electronics",5),
							(3,"Sony 55' TV", 1299.00, "Electronics",4),
							(4," Sony Playstation 5", 499.00, "Electronics",5),
							(5," Dell XPS 13", 1199.00, "computers",4),
                            (6,"MacBook Pro 13", 1299.00, "computers",5),
                            (7,"Nike Air Zoom", 129.00, "Footwear",4),
                            (8,"Adidas Ultraboost", 149.00, "Footwear",5),
                            (9,"Calvin Klein T-Shirt", 29.99, "clothing",3),
                            (10,"Levi's Jeans", 59.99, "Clothing",4);
select * from products;                            

-- 1. Retrieve the names and prices of all products with a rating of 5, ordered by price from lowest to 
-- highest.

select name, price from products where rating = 5 order by price;

-- 2. Find the average price of all products in each category, ordered by category name alphabetically.

select category, avg(price) from products group by category order by category;

-- 3. Retrieve the names and categories of all products with a price greater than 1000, ordered by 
-- category alphabetically

select name, category from products where price > 1000 order by category;

-- 4. Find the total number of products in each category with a rating greater than or equal to 4.
select category, count(*) from products where rating >= 4 group by category;

-- 5. Retrieve the names and ratings of all products with names containing the word 'red', ordered by 
-- rating from highest to lowest.

select name, rating from products where name like "%book%" order by rating desc;



-- Case study 2 -- 

create table orderss(order_id integer,
					customer_id integer,
                    order_date date,
                    total_price decimal,
                    primary key(order_id));

insert into orderss values(1,101,"2002-03-01",25.00),
						  (2,102,"2021-12-05",50.00),
                          (3,103,"2022-02-14",100.00),
                          (4,104,"2021-11-28",75.00),
                          (5,101,"2022-01-10",40.00),
                          (6,105,"2021-10-15",80.00),
                          (7,106,"2022-04-02",60.00),
                          (8,102,"2022-02-21",35.00),
                          (9,101,"2022-03-15",20.00),
                          (10,105,"2021-12-10",90.00);

-- 1. Find the total price of all orders placed on or after January 1st, 2022

select sum(total_price) from orderss where order_date >= "2022-01-01";

-- 2. Retrieve the customer IDs and the total number of orders each customer has placed, ordered by 
-- the number of orders from highest to lowest.

select customer_id, count(customer_id) as num from orderss group by customer_id order by num desc;

-- 3. Find the total price of all orders placed by customer with ID 123.

select sum(total_price) from orderss where customer_id = 123;

-- 4. Retrieve the order IDs and total prices of all orders placed in 2021, ordered by total price from 
-- highest to lowest.

select order_id, sum(total_price) as total 
	  from orderss 
      where year(order_date) = 2021
      group by order_id
      order by total desc;

-- 5. Find the number of orders placed on each day, ordered by date from oldest to newest.

select order_date, count(order_id) from orderss group by order_date order by order_date asc;

 -- CASE STUDY  3-- 

use srinu;

create table customer(customer_id integer,
						name varchar(20),
                        email varchar(30), 
                        primary key(customer_id));
                        
                        
insert into customer values(1, "John Smith", "john.smith@gmail.com"),
						   (2, "Jabe Die", "jane.doe@yahoo.com"),
                           (3, "James Brown", "james.brown@outlook.com"),
                           (4, "Jennifer Lee", "jennifer.lee@stanford.edu"),
                           (5, "Jason Chen", "jason.chen@berkeley.edu"),
                           (6, "Jessica Kim", "jessica.kim@gmail.com"),
                           (7, "Jack Lee", "jack.lee@hotmail.com"),
                           (8, "Joyce Chen", "joyce.chen@nyu.edu"),
                           (9, "Jasmine Liu", "jasmine.liu@mit.edu"),
                           (10, "Justin Wong", "justin.wong@gmail.com");
							
-- insert into customer values(1,"srinu","dharpally");

-- 1. Retrieve the names and email addresses of customers who have "gmail.com" domain email 
-- addresses.

select name, email from customer where email like "%@gmail.com";

-- 2. Retrieve the customer IDs and the number of customers with the same name, ordered by the 
-- number of customers from highest to lowest.

select name, count(customer_id) from customer group by name order by count(customer_id) desc;

-- 3. Find the names and email addresses of all customers whose email addresses end with ".edu".

select name, email from customer where email like "%.edu";

-- 4. Retrieve the customer IDs and names of all customers whose names start with the letter "J", 
-- ordered by name from A to Z.

select customer_id, name from customer where name like "J%" order by name;

-- 5. Find the number of customers who have email addresses from each domain, ordered by the 
-- number of customers from highest to lowest

-- select email, count(email) from customer group by email order by count(email) desc;

select substring_index(email, '@', -1) as domain,
	   count(*) as num_customers from customer
       group by domain order by num_customers desc;


-- CASE study 4 -- 

create table order_items(order_id integer, product_id integer, qunatity integer);

insert into order_items values(1,1,2),
							  (1,3,1),
                              (2,2,1),
                              (2,4,1),
                              (2,6,2),
                              (3,5,1),
                              (3,4,1),
                              (3,10,3),
                              (4,8,2),
                              (4,9,2);
                              

select product_id, qunatity from order_items;

select order_id, sum(qunatity) from order_items group by order_id order by order_id;

select product_id from order_items order by qunatity desc limit 1;

select order_id, product_id from order_items where qunatity > 1;


select product_id, qunatity from order_items order by qunatity desc;

-- CASE STUDY 5 --

create table employee(employee_id integer, name varchar(20), hire_date date, salary decimal, primary key(employee_id));
 
 insert into employee values(1, "John Smith", "2018-06-01", 55000.00),
					         (2, "Jane Doe", "2019-01-15", 65000.00),
                             (3, "Bob Johnson", "2020-05-20", 75000.00),
                             (4, "Mary Lee", "2021-02-28", 80000.00),
                             (5, "Mike Smith", "2022-01-01", 90000.00),
                             (6, "Sarah Chen", "2022-04-15", 70000.00);
	


select name from employee where hire_date > "2019-01-14";

select * from employee;

select year(hire_date) as year, avg(salary) as salary from employee group by year;

select year(hire_date) as year, count(*) as num_employ from employee group by year order by year asc;

select name, salary from employee order by salary desc limit 1;

select year(hire_date) as year, sum(salary) as ts from employee group by year order by ts desc;

 

