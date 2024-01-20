CREATE TABLE Employee (
    eid INT PRIMARY KEY,
    name VARCHAR(255),
    salary int,
    dateofemployee DATE
);

INSERT INTO Employee (eid, name, salary, dateofemployee) VALUES
(1, 'Sam', 50000, '2020-01-15'),
(111, 'Jane', 60000, '2019-05-20'),
(3, 'Robert', 45000, '2021-02-10'),
(4, 'Alice', 55000, '2018-11-30'),
(5, 'Eva', 8000, '2022-03-25');

CREATE TABLE Teacher (
    tid INT PRIMARY KEY,
    faculty VARCHAR(255),
    eid INT FOREIGN KEY REFERENCES Employee(eid)
);

INSERT INTO Teacher (tid,faculty, eid) VALUES
(201,'Computer', 1),
(202,'Civil', 111),
(203,'Electronics', 3),
(204,'Computer', 4),
(205,'Electrical', 5);

CREATE TABLE Student (
    sid INT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    dob DATE,
    tid INT REFERENCES Teacher(tid)
);

INSERT INTO Student (sid, name, age, dob, tid) VALUES
(501, 'Bob', 20, '2004-05-15', 201),
(502, 'Ram', 22, '2002-08-20', 202),
(503, 'Lisa', 21, '2003-03-10',203),
(504, 'David', 19, '2005-07-30',204),
(505, 'Emily', 20, '2004-01-25',205);

CREATE TABLE issued (
    iid INT PRIMARY KEY,
    bid INT,
	issuedAt DATE,
    issuedby INT,
    FOREIGN KEY (issuedby) REFERENCES Teacher(tid)
);

INSERT INTO issued VALUES
(1001,20,'2015-01-01', 201),
(1002,22,'2015-01-01', 202),
(1003,21,'2023-03-10',203),
(1004,19,'2020-07-30',204),
(1005,20,'2022-01-25',205);


CREATE TABLE book (
    bid int not null,
    bname VARCHAR(255),
    publication VARCHAR(255),
    author VARCHAR(255),
    price INT,
	PRIMARY KEY(bid)
);

INSERT INTO book VALUES
(300,'Science', 'Ekta', 'Yato', 300),
(301,'Mathematics', 'Readmore', 'Yui', 400),
(302,'Physics', 'Ekta', 'Sasuke', 500),
(303,'Chemistry', 'Asmita', 'Yagami', 600),
(304,'DBMS', 'Oasis', 'Horikita', 700);

-- 1
SELECT bname,publication,author from Book where publication = 'ekta';

-- 2 can't display name as it is in employee (use view)
SELECT * from teacher where tid IN (SELECT issuedBy from Issued where issuedAt = '2015-01-01');

-- 3 
SELECT name from Employee where salary > 10000 AND eid IN 
(SELECT eid from teacher where faculty = 'computer')

-- 7 
UPDATE Employee SET salary = salary*1.1;

-- 8 
Update Book SET bname = 'DATABASE' where bname = 'DBMS'

-- 9
Update Employee set salary = salary*1.2 where salary < 25000;

-- 10
Update Employee SET salary = 
CASE when salary > 20000 then salary*1.05
else salary*1.2
end;

-- 11 can't delete fk
DELETE FROM Employee where eid = 111;





