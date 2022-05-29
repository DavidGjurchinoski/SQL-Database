USE [SEDCACADEMYDB];

--01--
SELECT * FROM [Student]
WHERE [FirstName] = 'Antonio';

--02--
SELECT * FROM [Student]
WHERE [DateOfBirth] > '1999.01.01';

--03--
SELECT * FROM [Student]
WHERE [LastName] = 'J*' AND [EnrolledDate] > '1999.01';

--04--
SELECT * FROM [Student]
ORDER BY [FirstName];

--05--
SELECT [LastName] FROM [Teacher]
UNION
SELECT [LastName] FROM [Student]

--06--
--Added foreign key when creating the table--

--07--
SELECT * FROM [Course]
LEFT JOIN [AchivmentType] ON [Course].[ID] = [AchivmentType].[ID];
--IDK how to check if student can pass--

--08--
SELECT * FROM [Teacher]
LEFT JOIN [Grade] ON [Teacher].[ID] = [Grade].[ID]
WHERE [Grade].[TeacherID] IS NULL;
