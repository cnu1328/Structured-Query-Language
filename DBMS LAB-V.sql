use srinu;

create table boats(boat_id integer not null,
				   boat_name varchar(20) not null,
                   color varchar(10) not null, 
				   length integer not null,
                   sail_area integer not null,
                   primary key(boat_id));
                   
create table sailors(sailor_id integer not null,
					 name varchar(20) not null,
                     dob date not null,
                     nationality varchar(20) not null,
                     experience integer not null,
                     primary key(sailor_id));
                     
insert into boats values(1, "Sea Breeze", "Blue", 30, 450),
						(2, "Wind Dancer", "Red", 25, 375),
						(3, "Oceanic", "White", 40, 600),
						(4, "Wave Rider", "Yellow", 35, 525);
                        
select * from boats;

insert into sailors values(1, "John Smith", "1990-02-15", "American", 5),
						   (2, "Maria Garcia", "1985-07-28", "Spanish", 10),
						   (3, "James Brown", "1995-04-03", "British", 2),
						   (4, "Anna Nguyen", "1992-12-19", "Vietnamese", 7),
						   (5, "Roberto Silva", "1988-11-11", "Brazilian", 3);

select * from sailors;

create table bookings(booking_id integer not null,
					  sailor_id integer not null,
                      boat_id integer not null,
                      start_date date not null,
                      end_date date not null,
                      price decimal not null,
                      foreign key(sailor_id) references sailors(sailor_id),
                      foreign key(boat_id) references boats(boat_id)); 

-- alter table bookings add constraint primary key(booking_id);

insert into bookings values(1, 1, 2, "2023-06-01", "2023-06-05", 500.00),
						   (2, 3, 3, "2023-07-10", "2023-07-15", 900.00),
						   (3, 5, 1, "2023-08-21", "2023-08-28", 750.00),
						   (4, 2, 4, "2023-09-05", "2023-09-08", 400.00),
						   (5, 4, 2, "2023-10-01", "2023-10-05", 500.00);

select * from bookings;
           
-- 1. What is the total number of boats in the database? 
select count(*) from boats;

-- 2. What is the name of the boat with the highest sail area?
select boat_name from boats order by sail_area desc limit 1;

-- 3. What is the name of the sailor with the most sailing experience? 
select name from sailors where experience = (select max(experience) from sailors);
select name from sailors order by experience desc limit 1;

-- 4. What is the average length of all boats in the database? 
select avg(length) from boats;

-- 5. What is the total number of bookings made for the boat with ID 3? 
select count(*) from bookings where boat_id = 3;

-- 6. What is the average price of all bookings in the database? 
select avg(price) from bookings;

-- 7. What is the name of the sailor who made booking ID 1?
select sailors.name from sailors
inner join bookings on sailors.sailor_id = bookings.sailor_id 
where bookings.booking_id = 1;

-- 8. What is the color of the boat with the shortest length? 
select color from boats where length = (select min(length) from boats);
select color from boats order by length asc limit 1;

-- 9. What is the nationality of the sailor with ID 4?  
select nationality from sailors where sailor_id = 4;

-- 10. What is the sail area of the boat with ID 2? 
select sail_area from boats where boat_id = 2;

--  11. What is the total number of bookings made by the sailor with ID 5?
select count(*) from bookings where sailor_id = 5;

-- 12. What is the name of the boat with the highest length? 
select boat_name from boats order by length desc limit 1;

-- 13. What is the start date of the booking with the highest price? 
select start_date from bookings where price = (select max(price) from bookings);

-- 14. What is the name of the sailor who made the most recent booking?
select name from sailors 
inner join bookings on bookings.sailor_id = sailors.sailor_id
order by start_date desc limit 1;

 -- 15. What is the total number of sailors in the database? 
select count(*) from sailors;

-- 1. What is the name of the sailor who booked the boat named "Sea Breeze"?
select sailors.name from sailors
inner join bookings on bookings.sailor_id = sailors.sailor_id
inner join boats on bookings.boat_id = boats.boat_id
where boats.boat_name = 'Sea Breeze';

-- 2. What is the name of the sailor who booked the most expensive boat? 
select sailors.name from sailors
inner join bookings on bookings.sailor_id = sailors.sailor_id
where bookings.price = (select max(price) from bookings);

-- 3. What is the total number of bookings made for boats of color "red"?
select count(*) from bookings
inner join boats on bookings.boat_id = boats.boat_id
where boats.color = 'Red';

-- 4. What is the name of the sailor who booked the most number of boats?
select sailors.name, count(*) as total_count from sailors
inner join bookings on bookings.sailor_id = sailors.sailor_id
group by sailors.sailor_id order by total_count desc limit 1;

--  5. What is the total revenue generated from all bookings made by sailors of nationality "USA"?
select sum(price) from bookings
inner join sailors on bookings.sailor_id = sailors.sailor_id
where sailors.nationality = 'american' or sailors.nationality = 'spanish';

-- 6. What is the name of the boat that was booked by the sailor with ID 2 on 2023-09-05? 
select boats.boat_name from boats
inner join bookings on bookings.boat_id = boats.boat_id
where bookings.start_date = '2023-09-05' and sailor_id = 2;

-- 7. What is the total number of bookings made for each boat in the database? 
select bookings.boat_id, count(bookings.booking_id) from bookings
group by bookings.boat_id;

-- 8. What is the name of the sailor who made the earliest booking?
select sailors.name from sailors
inner join bookings on bookings.sailor_id = sailors.sailor_id
order by bookings.start_date asc limit 1; 

-- 9. What is the average price of bookings made by sailors of nationality "France"? 
select avg(price) from bookings
inner join sailors on sailors.sailor_id = bookings.sailor_id
where sailors.nationality = 'France';

-- 10.  What is the name of the sailor who made the most bookings in the year 2023?
select sailors.name, count(bookings.boat_id) as most_count from sailors
inner join bookings on bookings.sailor_id = sailors.sailor_id
-- where year(start_date) = 2023
where bookings.start_date >= '2023-01-01' and bookings.start_date <= '2023-12-31'
group by sailors.sailor_id order by most_count desc limit 1;


SELECT sailors.name
FROM bookings
JOIN sailors ON bookings.sailor_id = sailors.sailor_id
WHERE bookings.booking_id = 1;

-- select sailors.name
-- from bookings
-- join sailors order by bookings.start_date desc;

select sailors.name
	from sailors 
	natural join bookings
	order by bookings.start_date desc limit 1;



select sailors.name from sailors natural join bookings where bookings.booking_id = 1;















