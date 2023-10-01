use dbmslab;
drop table if exists schools;

create table  schools(schoolId int,
					  schoolName varchar(30) not null,
                      location varchar(30) not null,
                      established_year year not null);
                      
alter table schools modify column schoolId int primary key;
describe schools;

insert into schools values(1, "ABC High School", "New York", 1975),
						  (2, "XYZ Middle School", "London", 1988),
						  (3, "QR Elementary School", "Paris", 1995),
						  (4, "MNO High School", "Sydney", 2003),
						  (5, "EFG Middle School", "New York", 1990);
                          

create table students(StudentID int,
					  FirstName varchar(20) not null,
                      LastName varchar(20) not null,
                      Age int not null,
                      Gender  varchar(10) not null,
                      SchoolID int,
                      primary key(studentID),
                      foreign key(SchoolID) references schools(schoolId));
insert into students values(1, "John", "Smith", 16, "Male", 1),
						   (2, "Lisa", "Johnson", 15, "Female", 2),
						   (3, "Michael", "Smith", 14, "Male", 1),
						   (4, "Sarah", "Davis", 17, "Female", 4),
						   (5, "Robert", "Johnson", 13, "Male", 3);
    
-- drop table courses;
create table courses(CourseID int,
					CourseName  varchar(20) not null,
                    Teacher varchar(30) not null,
                    primary key(CourseID));

insert into courses values(1, "Math","Prof. Adams"),
						   (2, "Science", "Prof. Brown"),
							(3, "History", "Prof. Clark"),
							(4, "English", "Prof. Davis"),
							(5, "Art", "Prof. Adams");
-- drop table studentcourse;

create table studentcourse(StudentID int,
						  CourseID int,
                          Grade char(1),
                          foreign key(StudentID) references students(StudentID),
                          foreign key(CourseID) references courses(CourseID));
insert into studentcourse values(1, 1, "A"),
								(1, 2, "B"),
								(1, 3, "A"),
								(2, 3, "A"),
								(2, 4, "B"),
								(3, 5, "C"),
                                (4, 1, "A"),
								(5, 1, "B");

select * from schools;
select * from students;
select * from courses;
select * from studentcourse;

-- How many students are enrolled in the "Math" course?

select CourseName, count(*) from studentcourse
join courses on
courses.CourseID  = studentcourse.CourseID 
where courses.CourseName = 'Math';
 
--  What are the coursenames enrolled by female students?

select FirstName, LastName, CourseName from courses
join studentcourse
on studentcourse.CourseID = courses.CourseID
join students 
on studentcourse.StudentId = students.StudentID
where Gender = 'Female';

--  Display the school name(s) of students with Lastname as “Smith”?

select SchoolName from schools
join students
on schools.SchoolId = students.SchoolID
where LastName = 'Smith';

--  What is the course name, in which all enrolled students got grade A?

select distinct CourseName from courses
join studentcourse 
on courses.CourseID = studentcourse.CourseID
where Grade = 'A';

--   What is the total number of students in each school, sorted in descending order of
-- student count? ( Display : school name, student count )

select SchoolName, count(*) from schools
join students
on schools.SchoolID = students.SchoolID
group by students.SchoolID;

-- What is the name of the teacher, who is teaching more than One course? 
 select Teacher from courses 
 group by Teacher having count(*) >1;
 
 -- Display the grade awarded to maximum number of students?
 
 select Grade from studentcourse
 group by Grade order by count(*) desc limit 1;
 
 select Grade from studentcourse group by Grade order by count(*) desc limit 1; 
 
--  Display the Locations that has more than One school

select location from schools group by location having count(*) > 1 ;

 