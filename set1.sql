use dbmslab;

-- drop table libraybook;
-- drop table library;
-- drop table books;
-- drop table author;




create table author(authorid integer,
					author_name varchar(20) not null,
                    nationality varchar(20),
                    birth_year int not null,
                    gender varchar(6) not null,
                    primary key(authorid));

create table books(bookid integer,
				  title varchar(30) not null,
                  authorid integer,
                  publication_year int not null,
                  genere varchar(20) not null,
                  primary key(bookid),
                  foreign key(authorid) references author(authorid));

create table library(libraryid integer,
					 library_name varchar(20) not null,
                     location varchar(20),
                     capacity integer not null,
                     hours varchar(20) not null,
                     primary key(libraryid));
                     
create table libraybook(libraryid integer,
				  bookid integer,
                  foreign key(libraryid) references library(libraryid),
                  foreign key(bookid) references books(bookid));
                  
insert into author values
    (1, "Harper Lee", "American", 1926, "Female"),
    (2, "George Orwell", "British", 1903, "Male"),
    (3, "F. Scott Fitzgerald", "American", 1896, "Male"),
    (4, "J.R.R. Tolkien", "British", 1892, "Male"),
    (5, "Jane Austen", "British", 1892, "Female");

INSERT INTO books VALUES
    (1, 'To Kill a Mockingbird', 1, 1960, 'Fiction'),
    (2, 'sherlockholmes', 2, 1949, 'Fiction'),
    (3, 'The Great Gatsby', 3, 1925, 'Classics'),
    (4, 'The Hobbit', 4, 1937, 'Fantasy'),
    (5, 'Pride and Prejudice', 5, 1813, 'Romance');

INSERT INTO library VALUES
    (1, 'Central Library', 'New York', 1000, '9 AM - 9 PM'),
    (2, 'City Public Library', 'London', 800, '10 AM - 8 PM'),
    (3, 'National Library', 'Paris', 1200, '8 AM - 10 PM'),
    (4, 'Community Library', 'Sydney', 600, '10 AM - 7 PM'),
    (5, 'County Library', 'Los Angeles', 1500, '8 AM - 9 PM');

INSERT INTO libraybook VALUES
    (1, 1),
    (1, 3),
    (2, 1),
    (3, 2),
    (4, 4),
    (5, 5);

--  1. What is the title of the text book, authored by a female author and published 
-- before the year 1950?
select title from books join author on books.authorid = author.authorid
where gender = 'female' and books.publication_year < 1950;

-- 2. What are the names of the authors whose books are available in the "Central 
-- Library"?
select author_name from author
join books on books.authorid = author.authorid
join libraybook on libraybook.bookid = books.bookid
join library on library.libraryid = libraybook.libraryid
where library_name = 'central Library';

-- 3.   Which library has the Third highest book capacity? ( Display library name)
select library_name, capacity from library order by capacity desc limit 1 offset 2;

-- 4. What are the publication year of books in the "City Public Library"? 
select publication_year from books 
join libraybook on libraybook.bookid = books.bookid
join library on libraybook.libraryid = library.libraryid
where library_name = 'city public library';

-- 5. How many books are there in each genre? ( Display genre and books count)
select genere, count(*) from books group by genere;

-- 6. Display the titles of the text books authored by the authors with date of birth 
-- between 1900 -1950 ?  
select title from books
join author on author.authorid = books.authorid
where birth_year between 1900 and 1950;

--  7. Which author has the oldest published book?
select author.authorid, author_name from author
join books on books.authorid = author.authorid
order by publication_year limit 1;

-- 8. How many books ( with year of publication >1950) are available in each library, 
-- sorted in descending order of book count.
select library.libraryid, library_name, count(*) as bookcount from library
join libraybook on libraybook.libraryid = library.libraryid
join books on libraybook.bookid = books.bookid
where books.publication_year > 1950
group by libraryid order by bookcount desc;


 


                     
                     