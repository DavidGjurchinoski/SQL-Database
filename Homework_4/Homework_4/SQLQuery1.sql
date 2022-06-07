--Task 01--
GO
DECLARE @firstName NVARCHAR(222);
SET @FirstName = 'Antonio';

SELECT * FROM [Student]
WHERE FirstName = @FirstName;

--Task 02--
GO
DECLARE @FemaleEmployees TABLE
(StudentID INT, StudentName NVARCHAR(222), DateOfBirth DATE);

INSERT INTO @FemaleEmployees
SELECT ID, FirstName, DateOfBirth  FROM [Student]
WHERE Gender = 'F';

SELECT * FROM @FemaleEmployees;

--Task 03--
GO
CREATE TABLE #TempTable
(LastName NVARCHAR(222), EnrolledDate DATE);

INSERT INTO #TempTable
SELECT LastName, EnrolledDate FROM [Student]
WHERE Gender = 'M' AND FirstName LIKE 'A%';

SELECT * FROM #TempTable
WHERE LEN(LastName) = 7;

--Task 04--
SELECT * FROM [Student]
WHERE SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3);