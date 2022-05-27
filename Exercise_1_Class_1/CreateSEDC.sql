CREATE DATABASE [SEDC];

USE [SEDC];

CREATE TABLE [BusinessEntity](
	[Id] INT PRIMARY KEY NOT NULL,
	Name NVARCHAR(100),
	[Region] NVARCHAR(1000),
	[Zipcode] NVARCHAR(10),
	[Size] NVARCHAR(10)
);

CREATE TABLE [Employee](
	[Id] INT PRIMARY KEY NOT NULL,
	[FirstName] NVARCHAR(100) NOT NULL,
	[LastName] NVARCHAR(100) NOT NULL,
	[DateOfBirth] DATE,
	[Gender] NCHAR(1),
	[HireDate] DATE,
	[NationalIdNumber] NVARCHAR(20)
);

CREATE TABLE [Product](
	[Id] INT PRIMARY KEY NOT NULL,
	[Code] NVARCHAR(50),
	[Name] NVARCHAR(100),
	[Description] NVARCHAR(MAX),
	[Weight] DECIMAL(18,2),
	[Price] DECIMAL(18,2),
	[Cost] DECIMAL(18,2)
);

CREATE TABLE [Customer](
	[Id] INT PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[AcountNumber] NVARCHAR(50),
	[City] NVARCHAR(100),
	[RegionName] NVARCHAR(100),
	[CustomerSize] NVARCHAR(10),
	[PhoneNumber] NVARCHAR(20),
	[IsActive] BIT NOT NULL
);

CREATE TABLE [Order](
	[Id] BIGINT PRIMARY KEY NOT NULL,
	[OrderDate] DATETIME,
	[Status] SMALLINT,
	[BusinessEntityId] INT,
	[CustomerId] INT,
	[EmployeeId] INT,
	[TotalPrice] DECIMAL(18,2),
	[Comment] NVARCHAR(MAX)
);

CREATE TABLE [OrderDetails](
	[Id] BIGINT PRIMARY KEY NOT NULL,
	[OrderId] BIGINT,
	[ProductId] INT,
	[Quantity] INT,
	[Price] DECIMAL(18,2)
);

USE [master];

DROP DATABASE [SEDC];