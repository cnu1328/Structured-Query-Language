
use srinu;

create table products(product_id integer, name varchar(20),
	price decimal, category varchar(20), rating integer,
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

select name, price from products where rating = 5 order by price;

select category, avg(price) from products group by category order by category;

select name, category from products where price > 1000 order by category;


select category, count(*) from products where rating >= 4 group by category;

select * from products;

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


						  
									
select * from orderss;

select sum(total_price) from orderss where order_date >= "2022-01-01";


