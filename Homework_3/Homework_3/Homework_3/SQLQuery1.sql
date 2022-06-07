USE [SEDCACADEMYDB];

--Task 01--
SELECT [Grade].TeacherID as IdOfTeacher, COUNT([Grade].TeacherID) as NumberOfGrades FROM [Grade]
GROUP BY TeacherID;

--TASK 02--
SELECT [Grade].TeacherID as IdOfTeacher, COUNT([Grade].TeacherID) as NumberOfGrades FROM [Grade]
WHERE StudentID < 100
GROUP BY TeacherID;

--Task 03--
SELECT MAX([Grade].Grade) as HighestGrade, AVG([Grade].Grade) as AVGGrade FROM [Grade]
GROUP BY StudentID;

--Task 04--
SELECT COUNT([Grade].Grade) as NumberOfGrades
FROM [Grade]
GROUP BY TeacherID
HAVING COUNT([Grade].TeacherID) > 200;

--TASK 05--
SELECT MAX([Grade].Grade) as HighestGrade, AVG([Grade].Grade) as AVGGrade 
FROM [Grade]
GROUP BY StudentID
HAVING MAX([Grade].Grade) = AVG([Grade].Grade);

--Task 06--
SELECT [Student].FirstName, [Student].LastName, MAX([Grade].Grade) as HighestGrade, AVG([Grade].Grade) as AVGGrade
FROM [Grade]
LEFT JOIN [Student] ON [Grade].StudentID = [Student].ID
GROUP BY [Student].FirstName, [Student].LastName
HAVING MAX([Grade].Grade) = AVG([Grade].Grade);

--Task 07--
GO
CREATE OR ALTER VIEW vv_StudentGrades  
AS 
SELECT COUNT([Grade].Grade) NumberOfGrades, [Student].ID IDOfStudent 
FROM [Grade]
LEFT JOIN [Student] ON [Grade].StudentID = [Student].ID
GROUP BY [Student].ID;
GO
SELECT * FROM vv_StudentGrades;

--Task 08--
GO
ALTER VIEW vv_StudentGrades  
AS 
SELECT COUNT([Grade].Grade) NumberOfGrades, [Student].FirstName, [Student].LastName
FROM [Grade]
LEFT JOIN [Student] ON [Grade].StudentID = [Student].ID
GROUP BY [Student].FirstName, [Student].LastName;
GO
SELECT * FROM vv_StudentGrades;

--Task 09--
SELECT * FROM vv_StudentGrades
ORDER BY NumberOfGrades;