use srujana;

create table faculty(fid integer,
					fname varchar(30) not null,
                    qualification varchar(30) not null,
                    age real,
                    primary key(fid));
                    
create table course(cid varchar(5),
					cname varchar(20) not null,
                    textbook varchar(20) not null,
                    primary key(cid));

alter table course modify column textbook varchar(30) not null;

create table teach(fid integer,
				   cid varchar(20) not null,
                   year_sem varchar(3) not null,
                   foreign key(fid) references faculty(fid),
                   foreign key(cid) references course(cid));

INSERT INTO faculty VALUES (10, 'kavitha', 'M.Tech', 32),
							(11, 'vanitha', 'M.C.A', 29),
							(12, 'venu', 'M.Tech', 33);
                            
INSERT INTO course VALUES('CS201', 'DBMS', 'Database concepts'),
						('CS301', 'COA', 'Computer architecture'),
						('CS401', 'JAVA', 'Complete reference JAVA'),
						('CS302', 'FLAT', 'Formal languages');
                            
INSERT INTO teach VALUES (10, 'CS201', '2-1'),
						(10, 'CS301', '3-1'),
						(12, 'CS401', '4-1'),
						(11, 'CS301', '3-1'),
						(11, 'CS302', '3-1');
                        
-- 1.	Find faculty names whose qualification is “M.Tech” and teaches at least two different courses

select fname from faculty join teach on faculty.fid = teach.fid where qualification = 'M.Tech' group by teach.fid having count(*) >= 2;

-- 2. Find faculty names whose age is below 30 and teaches all the courses

select fname from faculty where fid in(select fid from teach group by fid having count(*) = (select count(*) from course));

-- select fname from faculty where not exists((select cid from course) except(select cid from teach where teach.fid = faculty.fid)) and age<30;

-- 3. Find course name and textbooks of the courses taught by either “kavitha” or “venu”

select cname, textbook from course inner join teach on course.cid = teach.cid inner join 
faculty on teach.fid = faculty.fid where fname = 'kavitha' or fname = 'venu';

-- 4. Count the no. of courses for each “year-sem”  

select year_sem, count(*) from teach group by year_sem;

-- 5. Alter the table courses to add a new attribute “credits” and 
-- update the credits tom 4 for the courses taught by faculty with fid 10 

alter table course add column credits integer;

desc course;

update course set credits = 4 where cid = (select cid from teach where fid = 10);
                    
                    