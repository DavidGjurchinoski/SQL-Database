USE [SEDCACADEMYDB];

USE [master];

CREATE TABLE [Teachers](
	[Id] INT PRIMARY KEY NOT NULL,
	[FirstName] NVARCHAR(100) NOT NULL,
	[LastName] NVARCHAR(100) NOT NULL,
	[DateOfBirth] DATE,
	[AcademicRank] BIGINT,
	[HireDate] DATE
);

CREATE TABLE [Students](
	[Id] INT PRIMARY KEY NOT NULL,
	[FirstName] NVARCHAR(100) NOT NULL,
	[LastName] NVARCHAR(100) NOT NULL,
	[DateOfBirth] DATE,
	[EnrolledDate] DATE,
	[Gender] NCHAR(1),
	[NationalIdNumber] NVARCHAR(20) NOT NULL,
	[StudentCardNumber] INT NOT NULL
);

CREATE TABLE [AchivmentTypes](
	[Id] INT PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[Description] NVARCHAR(MAX),
	[ParticipationRate] INT NOT NULL
);

CREATE TABLE [Courses](
	[Id] INT PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[Credit] INT,
	[AcademicYear] INT,
	[Semester] INT
);

CREATE TABLE [Grades](
	[Id] INT PRIMARY KEY NOT NULL,
	[StudentId] INT NOT NULL,
	[TeacherId] INT NOT NULL,
	[Grade] INT NOT NULL,
	[Comment] NVARCHAR(200),
	[CreateDate] DATE,
	FOREIGN KEY (StudentId) REFERENCES [Students](Id),
	FOREIGN KEY (TeacherId) REFERENCES [Teachers](Id)
);

CREATE TABLE [GradeDetails](
	[Id] INT PRIMARY KEY NOT NULL,
	[GradeId] INT NOT NULL FOREIGN KEY REFERENCES [Grades](Id),
	[AchivmentTypeId] INT NOT NULL FOREIGN KEY REFERENCES [AchivmentTypes](Id),
	[AchivmentPoints] INT NOT NULL,
	[AchivmentMaxPoints] INT,
	[AchivmentDate] DATE,
);

DROP TABLE [AchivmentTypes];
DROP TABLE [Courses];
DROP TABLE [GradeDetails];
DROP TABLE [Grades];
DROP TABLE [Students];
DROP TABLE [Teachers];