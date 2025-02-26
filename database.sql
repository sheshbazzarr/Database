-- Create a database 
-- create database 
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- Lets creat Student table 

CREAT TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age int
);


-- Course Table 
CREAT TABLE Course(
    Course_ID INT PRIMARY KEY,
    CourseName  VARCHAR(100)
    
);

CREATE TABLE Enrollment(
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);


-- insert into student table 

INSERT INTO Student (Student_ID, Name, Age)
VALUES 
(1, 'Daniel  Endale', 23),
(2, 'david  Adam', 22),
(3, 'Albert  Enistian', 35),
(4, 'Alen Turing', 18);

-- insert data to Course Table 
INSERT INTO Course (Course_ID, CourseName)
VALUES
(1, 'Computer Science 101'),
(2, 'Mathematics 101'),
(3, 'Physics 101'),


    -- insert data into the enrollment table  
INSERT INTO Enrollment (Enrollment_ID, Student_ID, Course_ID)
VALUES
(1, 1, 1),  
(2, 2, 1),  
(3, 3, 2),  
(4, 4, 1);  






-- let's query for student name and age in specific courses 
SELECT Student.Name, Student.Age
FROM Student, Enrollment, Course
WHERE Student.Student_ID = Enrollment.Student_ID
  AND Enrollment.Course_ID = Course.Course_ID
  AND Course.CourseName = 'Computer Science 101';


