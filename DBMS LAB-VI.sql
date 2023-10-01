-- create database dbmsLab;

use dbmsLab;

-- drop table customer;
-- drop table orders;
-- drop table Products;
-- drop table OrderItems;

create table customer(customer_id int,
						name varchar(20) not null,
                        email varchar(30) not null,
                        address varchar(50) not null,
                        primary key(customer_id));
                        
insert into customer values(4, "Emily Johnson", "emily@example.com", "987 Oak Lane"),
						   (5, "Michael Brown", "michael@example.com", "321 Elm Avenue"),
						   (6, "Sarah Davis", "sarah@example.com", "654 Main Street"),
						   (7, "Jessica Lee", "jessica@example.com", "123 Maple Road"),
						   (8, "Brian Wilson", "brian@example.com", "456 Pine Street");
                        
create table orders(order_id int,
					customer_id int,
                    order_date date not null,
                    total_amount decimal not null,
                    primary key(order_id),
                    foreign key (customer_id) references customer(customer_id));


                    
insert into orders values (4, 7, "2023-06-05", 120.00),
						  (5, 4, "2023-06-06", 45.00),
						  (6, 8, "2023-06-07", 80.00),
						  (7, 5, "2023-06-09", 65.00),
						  (8, 6, "2023-06-10", 95.00);
                    
create table Products(product_id int,
					  name varchar(20) not null,
                      description varchar(50),
                      price decimal not null,
                      primary key(product_id));
                      

insert into Products values (4, "Hoodie", "Warm hoodie, available in multiple colors", 29.99),
							(5, "Dress", "Elegant dress for special occasions", 59.99),
							(6, "Watch", "Stylish wristwatch with leather strap", 99.99),
                            (7, "Backpack", "Spacious backpack for everyday use", 49.99),
                            (8, "Sunglasses", "UV protection sunglasses", 24.99);
                      
                      
create table OrderItems(order_item_id int,
						order_id int,
                        product_id int,
						quantity int not null,
                        unit_price decimal not null,
                        primary key(order_item_id),
                        foreign key(order_id) references orders(order_id),
                        foreign key(product_id) references Products(product_id));

insert into OrderItems values(5, 4, 7, 2, 39.99),
							(6, 4, 5, 1, 49.99),
							(7, 5, 4, 1, 29.99),
							(8, 6, 6, 1, 99.99),
							(9, 6, 8, 2, 24.99);
                            
                            
-- 1. Retrieve products with a price less than $50
select * from Products where price < 50;

-- 2. Retrieve orders placed on or after June 5th, 2023:
select * from orders where order_date >= "2023-06-05"; 

-- 3. Retrieve the customers' names and their corresponding order count
select name, count(order_id) from customer natural join orders group by name;

-- 4. Retrieve the products and their average prices:
select name, avg(price) from products group by name;

-- 5. Retrieve the average price of all products:
select avg(price) from Products;

-- 6. Retrieve the customers who have placed orders:
select customer.customer_id, name, email, address from customer
join orders 
on customer.customer_id = orders.customer_id; 


select * from customer where customer_id in(select customer_id from orders);


select * from customer c 
		 where exists(select * from orders o
		 where o.customer_id = c.customer_id);

-- 7. Retrieve the customers who have not placed any orders:
select * from customer c 
		 where not exists(select * from orders o
		 where o.customer_id = c.customer_id);
         
select * from customer where customer_id not in(select customer_id from orders);

select * from customer;
select * from orders;

 -- 8. Retrieve the products with a price higher than the average price of all products:
 select * from Products where price > (select avg(price) from Products);
 
 -- 9. Retrieve the customers who have placed orders with a total amount 
-- higher than the average total amount of all orders:
select * from customer natural join orders
 where total_amount > (select avg(total_amount) from orders);
 
 select * from customer c 
 where exists(select * from orders o
 where c.customer_id = o.customer_id 
 and o.total_amount > (select avg(total_amount) from orders));

-- 10. Retrieve the orders placed by customers who live at the same address as a 
-- specific customer (e.g., customer with ID 1):

select order_id, o.customer_id, order_date, total_amount from orders o 
join customer c on o.customer_id = c.customer_id
where c.address = (select address from customer where customer_id = 4); 

select * from orders o
where exists(select * from customer c
where c.address= (select address from customer where customer_id = 4) 
and c.customer_id = o.customer_id);

select * from orders where orders.customer_id in(select customer_id from customer where address = (select address from customer where customer_id = 4));


-- 11. Retrieve the customers who have placed the highest total amount order:

select * from customer c
where exists(select * from orders o
where o.total_amount = (select max(total_amount) from orders)
and c.customer_id = o.customer_id);

select * from customer natural join orders
where total_amount = (select max(total_amount) from orders);

-- 12. Retrieve the products that have been ordered by customers who have 
-- also ordered a specific product (e.g., product with ID 2):
select products.product_id, name, products.description, price from products 
join orderitems on products.product_id = orderitems.product_id
join orders on orders.order_id = orderitems.order_id
where orderitems.product_id in(select product_id from orderitems where product_id=4);

-- 13. Retrieve the customers who have placed orders with a total amount 
-- higher than the total amount of orders placed by customers living at the 
-- same address: 
select customer.customer_id, name, email, address from customer
join orders on orders.customer_id = customer.customer_id
where total_amount > (select sum(total_amount) from orders where customer_id = customer.customer_id
and address = customer.address);

-- 14. Retrieve the products that have been ordered more than the average 
-- quantity ordered for each product: 
 select products.product_id, name, description, price from products
 join orderitems on orderitems.product_id = products.product_id
 join orders on orders.order_id = orderitems.order_id
 where quantity > (select avg(quantity) from orderitems);
 
 -- 15. Retrieve the customers who have placed orders for all available 
-- products: 
select customer.customer_id, customer.name, email, address from customer
join orders on orders.customer_id = customer.customer_id
join orderitems on orderitems.order_id = orders.order_id
join products on orderitems.product_id = products.product_id
where orderitems.product_id in (select product_id from products);

--  16. Retrieve the orders along with the corresponding customer information
select * from orders inner join customer on orders.customer_id = customer.customer_id;

-- 17. Retrieve the order items along with the corresponding product 
-- information:  
select * from orderitems inner join products on orderitems.product_id = products.product_id;

-- 18. Retrieve the customers who have placed orders and the total amount 
-- spent by each customer:
 select name, sum(total_amount) from orders 
 inner join customer on customer.customer_id = orders.customer_id group by name;
 
 -- 19. Retrieve the products that have been ordered and the total quantity 
-- ordered for each product: 
select products.name, sum(quantity) from orderitems
join products on products.product_id = orderitems.product_id
group by orderitems.product_id;

-- 20. Retrieve the orders along with the corresponding customer name and 
-- product name: 
select orders.order_id, customer.name, products.name, orderitems.quantity from orders
join customer on customer.customer_id = orders.customer_id
join orderitems on orderitems.order_id = orders.order_id
join products on orderitems.product_id = products.product_id;




					 
                        

                        