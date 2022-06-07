--Workshop 02.1--
GO
CREATE PROCEDURE CreateGrade
(
	@ID INT,
	@StudentID INT,
	@CourseID INT,
	@TeacherID INT,
	@Grade TINYINT,
	@Comment NVARCHAR(100),
	@CreateDate DATETIME,
	@TotalNumberOfGrades INT OUTPUT,
	@BestGradeStudent TINYINT,
	@BestGradeTeacher TINYINT
)
AS
BEGIN
	INSERT INTO [Grade] VALUES (@ID, @StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreateDate);

	SET @TotalNumberOfGrades = (SELECT COUNT(*) FROM [Grade] WHERE StudentID = @StudentID);

	SET @BestGradeStudent = (SELECT MAX(Grade) FROM [Grade] WHERE StudentID = @StudentID);
	SET @BestGradeTeacher = (SELECT MAX(Grade) FROM [Grade] WHERE TeacherID = @TeacherID);
END

--Workshop 02.2--
GO
CREATE PROCEDURE CreateGradeDetails
(
	@ID INT, 
	@GradeID INT, 
	@AchievementTypeID TINYINT, 
	@AchievementPoints TINYINT, 
	@AchievementMaxPoints TINYINT, 
	@AchievementDate DATETIME,
	@GradePoints TINYINT OUTPUT
)
AS
BEGIN
	SELECT 1 FROM [GradeDetails] 
	UPDATE [GradeDetails]
	SET 
		AchievementTypeID = @AchievementTypeID, 
		AchievementPoints = @AchievementPoints, 
		AchievementMaxPoints = @AchievementMaxPoints,
		AchievementDate = @AchievementDate
	WHERE GradeID = @GradeID

	SET @GradePoints = 
	(SELECT ([GradeDetails].AchievementPoints / ([GradeDetails].AchievementMaxPoints * [AchievementType].ParticipationRate)) AS GradePoints FROM [GradeDetails]
	LEFT JOIN [AchievementType] ON [GradeDetails].AchievementTypeID = [AchievementType].ID);
END
