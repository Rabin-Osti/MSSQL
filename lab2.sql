-- ********************* Ignore ******************
-- to find the exact constraint name i.e PK__Teacher__C456D729D2101ABC
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Teacher';

ALTER TABLE Teacher
DROP CONSTRAINT PK__Teacher__C456D729D2101ABC;

-- *******************************************

use labdb;

SELECT * from Teacher;
SELECT * FROM Student;
SELECT * FROM Employee;
SELECT * from Book;


-- Create the Employee table
CREATE TABLE Employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(255) NOT NULL,
    dateofemploy DATE DEFAULT '2010-01-01',
    salary int
);

-- Create the Booklist table
CREATE TABLE Booklist (
    isbn VARCHAR(10) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publication VARCHAR(255) NOT NULL
);

-- Create the Book table
CREATE TABLE Book (
    bid INT PRIMARY KEY,
    bname VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    price int CHECK (price < 5000)
);

-- Create the Issues table
CREATE TABLE Issues (
    IID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dateofissue DATE
);


INSERT INTO Employee (eid, ename, dateofemploy, salary) VALUES
(1, 'John Doe', '2012-05-15', 12000),
(2, 'Jane Smith', '2014-02-20', 15000),
(3, 'Bob Johnson', '2010-08-10', 10000),
(4, 'Alice Brown', '2015-11-30', 18000);

INSERT INTO Booklist (isbn, name, publication) VALUES
('500', 'Book1', 'PublicationA'),
('501', 'Book2', 'PublicationB'),
('502', 'Book3', 'PublicationC'),
('503', 'Book4', 'PublicationD');

INSERT INTO Book (bid, bname, author, price) VALUES
(101, 'The Art of SQL', 'John Smith', 4500),
(102, 'Programming in Python', 'Alice Johnson', 3000),
(103, 'Data Structures', 'Bob White', 4800),
(104, 'Introduction to Java', 'Jane Doe', 3500);

INSERT INTO Issues (IID, name, dateofissue) VALUES
(201, 'John Doe', '2022-01-15'),
(202, 'Alice Brown', '2022-02-20'),
(203, 'Bob Johnson', '2022-03-10'),
(204, 'Jane Smith', '2022-04-30');

-- 2. Set default value of ‘dateofemploy’ attribute as jan 1, 2010.

create table Random(name varchar(100), dob date);

ALTER TABLE Random
ADD CONSTRAINT DF_dob DEFAULT '2010-01-01' FOR dob;

insert into Random values('rabin',default);
insert into Random(name) values ('hiyori');
insert into Random(name) values ('yato'),('zenitsu');
select * from Random;

-- 4. All the price of books must be less than 5000.
create table list(price int not null);
ALTER TABLE list ADD CHECK (price < 5000);
insert into list values(100),(4000);
select * from list;

--5. To remove not null after creating table
ALTER COLUMN bname VARCHAR(255);

-- 8. Display eid and ename of all employees whose salary is less than 10000.
SELECT eid, ename FROM Employee WHERE salary < 10000;

-- 9. Display all records of books whose price ranges from 2500 to 5000.
SELECT * FROM Book WHERE price BETWEEN 2500 AND 5000;

-- 10. Display all records from booklist relation whose publication name starts from ‘E’ eg Ekta.
SELECT * FROM Booklist WHERE publication LIKE 'E%';

-- 11. Display all records from employee table whose name ends with ‘ta’ eg Sita, Geeta etc.
SELECT * FROM Employee WHERE ename LIKE '%ta';

-- 12. Table whose name exactly consists of 5 characters.
SELECT name FROM Booklist WHERE name like '_____';

-- 13. Display all records from employee table where name starts with ‘S’ and salary greater than 10000.
SELECT * FROM Employee WHERE ename LIKE 'S%' AND salary > 10000;

-- 14. Display all records from book table where either bookid lies in range 1001 to 2000 or price range in 1000 to 2500.
SELECT * FROM Book WHERE bid BETWEEN 1001 AND 2000 OR price BETWEEN 1000 AND 2500;

-- 15. Display ISBN number and bookname where booklist must not contain ISBN no. 1003.
SELECT isbn, name FROM Booklist WHERE isbn = '1003';
