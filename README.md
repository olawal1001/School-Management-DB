**SCHOOL MANAGEMENT DATABASE PROJECT**

This repository contains the SQL script for creating a School Management System database.

**Problem Statement:** 

As educational programs become more intricate and student populations expand, reliance on traditional paper-based systems becomes increasingly inadequate and error-prone. The challenge lies in the effective management of student information, course details, and enrollment data within educational institutions. This project aims to address the challenges encountered by educational institutions in efficiently managing student enrollment information.

**Key challenges addressed by the project include:**

**Data Management:** Organizing and storing student information, course details, and enrollment records in a centralized database to ensure accuracy, consistency, and accessibility.

**Enrollment Process:** Streamlining the enrollment process by providing a systematic mechanism for students to register for courses, track their progress, and manage their academic journey effectively.

**Reporting and Analysis:** Generating reports and conducting analysis to gain insights into student demographics, enrollment trends, course popularity, and other key metrics to support decision-making and strategic planning.

**Data Integrity and Security:** Ensuring data integrity and security by implementing robust data validation measures, access controls, and backup procedures to safeguard sensitive information and prevent unauthorized access or data loss.

By developing a comprehensive School Management System Database, the project aims to enhance the efficiency, transparency, and effectiveness of educational institutions in managing their operations and supporting the academic success of students.

**Structure:**

**Students Table:**

**Columns:** StudentID, FirstName, LastName, Level. Primary Key: StudentID.

**Courses Table:**

**Columns:** CourseID, CourseName. Primary Key: CourseID.

**Enrolments Table:**

**Columns:** EnrollmentID, StudentID (Foreign Key referencing Students), CourseID (Foreign Key referencing Courses). Primary Key: EnrollmentID.

**Sample Data Insertion:** Sample data for students, courses, and enrolments is provided to demonstrate the functionality of the database.

**Data Manipulation:** Simulated updates include changing a student's name and removing a course.

**Queries:** List all Students:

SELECT * FROM Students; List all Courses:

SELECT * FROM Courses; List all Enrolments:

SELECT * FROM Enrolments; Filter Students based on Level:

SELECT * FROM Students WHERE Level = 500 ORDER BY LastName; List Courses with Enrolled Students Count:

SELECT Enrolments.CourseID, MAX(Courses.CourseName) AS CourseName, COUNT(Enrolments.StudentID) AS EnrolledStudents FROM Enrolments JOIN Courses ON Enrolments.CourseID = Courses.CourseID GROUP BY Enrolments.CourseID; Find Students Enrolled in a Specific Course (e.g., CourseID = 102):

SELECT Students.StudentID, Students.FirstName, Students.LastName FROM Students INNER JOIN Enrolments ON Students.StudentID = Enrolments.StudentID WHERE Enrolments.CourseID = 102;

Updates: Simulated updates include changing a student's name and removing a course.

**TOOL:** MICROSOFT SQL SERVER 
