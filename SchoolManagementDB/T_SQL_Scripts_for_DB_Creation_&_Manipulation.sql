-- This is an example script
CREATE DATABASE SchoolManagementSystem;
USE SchoolManagementSystem;

-- create students table 
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Level INT
);
--Create  courses table 
CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(50)
); 

--Create Enrolment table
CREATE TABLE Enrolments(
	EnrollmentID INT PRIMARY KEY,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	CourseID INT FOREIGN KEY REFERENCES Courses(CourseID)
);
--Next is to populate the table 

--Insert data into Students Table 
INSERT INTO Students VALUES (1001, 'Akomolafe Gabriel', 100);
INSERT INTO Students VALUES (1002, 'Edun Babafemi', 100);
INSERT INTO Students VALUES (1003, 'Adenugba Pete', 200);
INSERT INTO Students VALUES (1004, 'Francis Okoye', 200);
INSERT INTO Students VALUES (1005, 'Alozie Chigozie', 300);
INSERT INTO Students VALUES (1006, 'Bamidele Jooda', 300);
INSERT INTO Students VALUES (1007, 'Nkpuma Chioma', 400);
INSERT INTO Students VALUES (1008, 'Bello Morenikeji', 400);
INSERT INTO Students VALUES (1009, 'Ogunbiyi Olalekan', 500);
INSERT INTO Students VALUES (1010, 'Odu Adebowale', 500);

SELECT * FROM Students;


--Insert data into Courses Table 
INSERT INTO Courses VALUES (101, 'Mathematics for Data Science');
INSERT INTO Courses VALUES (102, 'Basic Statistics');
INSERT INTO Courses VALUES (103, 'Advanced Excel');
INSERT INTO Courses VALUES (104, 'Python');

SELECT * FROM Courses;

--Insert data into Enrolments Table
INSERT INTO Enrolments VALUES (001, 1001, 101);
INSERT INTO Enrolments VALUES (002, 1002, 101);
INSERT INTO Enrolments VALUES (003, 1003, 101);
INSERT INTO Enrolments VALUES (004, 1004, 102);
INSERT INTO Enrolments VALUES (005, 1005, 102);
INSERT INTO Enrolments VALUES (006, 1006, 102);
INSERT INTO Enrolments VALUES (007, 1007, 103);
INSERT INTO Enrolments VALUES (008, 1008, 103);
INSERT INTO Enrolments VALUES (009, 1009, 104);
INSERT INTO Enrolments VALUES (010, 1010, 104);

SELECT * FROM Enrolments;

-- Update student information (e.g., name change)
UPDATE Students 
SET StudentName = 'Lawal Olamilekan' 
WHERE StudentID = 1002;

--Update student names to have first name and last name columns
ALTER TABLE Students
ADD FirstName VARCHAR(50),
    LastName VARCHAR(50);

--Update the values in the new columns based on the existing StudentName column
UPDATE Students
SET FirstName = LEFT(StudentName, CHARINDEX(' ', StudentName) - 1),
    LastName = SUBSTRING(StudentName, CHARINDEX(' ', StudentName) + 1, LEN(StudentName));


-- Simulate course removal by deleting a course and related enrolments
--Delete from Courses and Enrolments
DELETE FROM Courses WHERE CourseID = 101;
DELETE FROM Enrolments WHERE CourseID = 101;

--To check the List of all students 
SELECT * FROM Students;

--To check the List of all courses
SELECT * FROM Courses;

--Filter Students based on Level
SELECT * FROM Students
WHERE Level = 500
ORDER BY StudentName;

--List courses along with the number of enrolled students per course (Breakdown this code for more understanding)
SELECT 
    Enrolments.CourseID,
    MAX(Courses.CourseName) AS CourseName,
    COUNT(Enrolments.StudentID) AS EnrolledStudents
FROM Enrolments
JOIN Courses ON Enrolments.CourseID = Courses.CourseID
GROUP BY Enrolments.CourseID;

--Find students enrolled in a specific course
SELECT Students.StudentID, Students.StudentName
FROM Students
INNER JOIN Enrolments ON Students.StudentID = Enrolments.StudentID
WHERE Enrolments.CourseID = 102;


  



