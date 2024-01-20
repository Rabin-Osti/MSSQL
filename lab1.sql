create database labdb;
use labdb;

-- 1. Create tables with the specified schema
CREATE TABLE Student (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    RN INT,
    Batch VARCHAR(255)
);

CREATE TABLE Teacher (
    TID INT PRIMARY KEY,
    Name VARCHAR(255),
    Faculty VARCHAR(255)
);

-- 2. Insert five records in each table
INSERT INTO Student (ID, Name, RN, Batch) VALUES
(1, 'Student1', 101, 'BatchA'),
(2, 'Student2', 102, 'BatchB'),
(3, 'Student3', 103, 'BatchC'),
(4, 'Student4', 104, 'BatchA'),
(5, 'Student5', 105, 'BatchB');

INSERT INTO Teacher (TID, Name, Faculty) VALUES
(101, 'Teacher1', 'Math'),
(102, 'Teacher2', 'Science'),
(103, 'Teacher3', 'English'),
(104, 'Teacher4', 'History'),
(105, 'Teacher5', 'Computer Science');

-- 3. Display all records
SELECT * FROM Student;
SELECT * FROM Teacher;

-- 4. Display only ID and Name from student table
SELECT ID, Name FROM Student;

-- 5. Display Name and Faculty from Teacher table
SELECT Name, Faculty FROM Teacher;

-- 6. Remove 'RN' attribute from student relation
ALTER TABLE Student DROP COLUMN RN;

-- 7. Add 'salary' attribute to teacher relation
ALTER TABLE Teacher ADD Salary INT;

-- 8. Copy ID and name attribute to new relation 'info_student'
SELECT ID,NAME INTO info_student FROM Student;  

-- 9. Display all records from info_student
SELECT * FROM info_student;

-- 10. Delete all contents from info_student relation
DELETE FROM info_student;
-- or
TRUNCATE TABLE info_student;
