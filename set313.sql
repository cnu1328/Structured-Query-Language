use srujana;

create table customer(cid integer,
					  cname varchar(30) not null,
					  city varchar(30) not null,
                      primary key(cid));

create table products(pid varchar(30) not null,
					  pname varchar(30) not null,
                      category varchar(30) not null,
                      price real,
                      primary key(pid));
                      
                      
create table orders(cid integer,
					pid varchar(30) not null,
                    day date not null,
                    foreign key(cid) references customer(cid),
                    foreign key(pid) references products(pid));
                    
                    
                    
                    
INSERT INTO customer VALUES(1, 'Raju', 'Warangal'),
							(2, 'Anil', 'Adilabad'),
							(3, 'Sunil', 'Warangal');
                            
INSERT INTO products VALUES('M1', 'motoE', 'mobiles', 5000),
							('M2', 'motoG', 'mobiles', 9000),
							('S1', 'Samsung-s4', 'mobiles', 20000),
							('W1', 'Fasttrack1', 'watches', 2000);
                            
                            
INSERT INTO orders VALUES(1, 'M1', '01/10/15'),
						(1, 'W1', '01/10/15'),
						(2, 'M2', '01/11/15'),
						(3, 'W1', '02/12/15'),
						(2, 'W1', '02/12/15');
                        
-- 1. Find the product details which has been ordered by all the customers
 -- select * from products where not exists((select cid from customer) 
 -- except(select cid from orders where orders.pid = products.pid));
 
select * from products where pid in(select pid from orders group by pid having count(*) = (select count(*) from customer));

    
--  2.	Find customer name and city who have not ordered a mobile

select cname, city from customer where cid in(select cid from orders
inner join products on orders.pid = products.pid where category != 'mobiles');

-- 3. Find customer ids who have ordered product with maximum price in each category
select cid from orders where pid in(select pid from products
where (price, category) in(select max(price), category from products group by category));


select pid from products where (price, category) in(select max(price), category from products group by category);


-- 4. Find the days on which at least two orders are placed
select day from orders group by day having count(day) >= 2;

-- 5. Find the customer id who are from same city and ordered same product
select cid from customer where cid in((select c1.cid from customer c1, customer c2 where c1.cid != c2.cid and c1.city = c2.city) 
intersect 
(select d1.cid from orders d1, orders d2 where d1.cid != d2.cid and d1.pid = d2.pid));



