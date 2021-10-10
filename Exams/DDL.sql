CREATE TABLE [Departments](
							[Id] INT PRIMARY KEY IDENTITY NOT NULL,
							[Name] VARCHAR(50) NOT NULL
                         )

CREATE TABLE [Status]    (
							[Id] INT PRIMARY KEY IDENTITY NOT NULL,
							[Label] VARCHAR(30) NOT NULL
                         )

CREATE TABLE [Users]     (
							[Id] INT PRIMARY KEY IDENTITY NOT NULL,
							[Username] VARCHAR(30) NOT NULL UNIQUE,
							[Password] VARCHAR(50) NOT NULL,
							[Name] NVARCHAR(50),
							[Birthdate] DATETIME2,
							[Age] INT,
							CHECK (Age > 14 AND Age < 110),
							[Email] NVARCHAR(50) NOT NULL
                         )

CREATE TABLE [Employees] (
							[Id] INT PRIMARY KEY IDENTITY NOT NULL,
							[FirstName] VARCHAR(25),
							[LastName] VARCHAR(25),
							[Birthdate] DATETIME2,
							[Age] INT,
							CHECK(Age > 18 AND Age < 110),
							[DepartmentId] INT FOREIGN KEY REFERENCES [Departments]([Id])
                         )

CREATE TABLE [Categories](
							[Id] INT PRIMARY KEY IDENTITY NOT NULL,
							[Name] VARCHAR(50) NOT NULL,
							[DepartmentId] INT FOREIGN KEY REFERENCES [Departments]([Id]) NOT NULL
                         )

CREATE TABLE [Reports]   (
							[Id] INT PRIMARY KEY IDENTITY NOT NULL,
							[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]) NOT NULL,
							[StatusId] INT FOREIGN KEY REFERENCES [Status]([Id]),
							[OpenDate] DATETIME2 NOT NULL,
							[CloseDate] DATETIME2,
							[Description] VARCHAR(250) NOT NULL,
							[UserId] INT FOREIGN KEY REFERENCES [Users]([Id]) NOT NULL,
							[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id])
                         )


		
INSERT INTO [Employees] ([FirstName], [LastName], [Birthdate], [DepartmentId])
       VALUES 
			('Marlo', 'O"MAlley', '1958-09-21', 1),
			('Niki', 'Stanaghan', '1969-11-26', 4),
			('Ayrton', 'Senna', '1960-03-21', 9),
			('Ronnie', 'Peterson', '1944-02-14', 9),
			('Giovanna', 'Amati', '1959-07-20', 5)

INSERT INTO [Reports] ([CategoryId], [StatusId], [OpenDate], [CloseDate], [Description], [UserId], [EmployeeId])
       VALUES
	        (1, 1, '2017-04-13', NULL, 'Stuck Road on Str.133', 6, 2),
			(6, 3, '2015-09-05', '2015-12-06', 'Charity trail running', 3, 5),
			(14, 2, '2015-09-07', NULL, 'Falling bricks on Str.58', 5, 2),
			(4, 3, '2017-07-03', '2017-07-06', 'Cut off streetlight on Str.11', 1, 1)


UPDATE [Reports]
       SET [CloseDate] = GETDATE()
	   WHERE [CloseDate] IS NULL


DELETE FROM [Reports]
       WHERE [Id] = 4

SELECT [Description], CONVERT(VARCHAR, [OpenDate], 105) 
       FROM [Reports]
	   WHERE [EmployeeId] IS NULL
	   ORDER BY [OpenDate], [Description]

SELECT [Description], [Name] AS [CategoryName]
       FROM [Reports] AS r
	   LEFT JOIN [Categories] AS c
	   ON r.CategoryId = c.Id
	   ORDER BY [Description], [CategoryName]

SELECT TOP(5) [Name] AS [CategoryName], COUNT(c.[Id]) AS [ReportsNumber]
       FROM [Categories] AS c
	   JOIN [Reports] AS r
	   ON c.Id = r.CategoryId
	GROUP BY c.[Name]
	ORDER BY [ReportsNumber] DESC, [CategoryName]

SELECT u.[Username], c.[Name] AS [CategoryName] 
        FROM [Categories] AS c
		JOIN [Reports] AS r
		ON c.Id = r.CategoryId
		JOIN [Users] AS u
		ON r.UserId = u.Id
		WHERE DATEPART(MONTH, u.[Birthdate]) = DATEPART(MONTH, r.OpenDate) AND DATEPART(DAY, u.[Birthdate]) = DATEPART(DAY, r.OpenDate)
		ORDER BY [Username], [CategoryName]
	
SELECT CASE WHEN COALESCE(e.FirstName,e.LastName) IS NOT NULL
			THEN CONCAT(e.FirstName,' ',e.LastName)
			ELSE
			'None'
			END AS Employee, ISNULL(d.[Name], 'None')
             AS [Department], ISNULL(c.[Name], 'None') AS [Category],
			 ISNULL(r.[Description], 'None'), ISNULL(CONVERT(VARCHAR, r.[OpenDate], 104), 'None'), ISNULL(s.[Label], 'None')
			 AS [Status], ISNULL(u.[Name], 'None') AS [User]
       FROM Reports AS r
	   LEFT JOIN Employees AS e
	   ON e.Id = r.EmployeeId
	   LEFT JOIN Categories AS c
	   ON c.[Id] = r.[CategoryId]
	   LEFT JOIN [Departments] AS d
	   ON d.[Id] = e.[DepartmentId]
	   LEFT JOIN [Status] AS s
	   ON r.[StatusId] = s.[Id]
	   LEFT JOIN [Users] AS u
	   ON u.[Id] = r.[UserId]
       ORDER BY e.[FirstName] DESC, e.[LastName] DESC, [Department], [Category], [Description], [OpenDate], [Status], [User]

CREATE FUNCTION udf_HoursToComplete(@StartDate DATETIME, @EndDate DATETIME)
RETURNS INT 
BEGIN
     RETURN ( SELECT 
	           ISNULL(CASE
	             WHEN DATEDIFF(HOUR, @StartDate, @EndDate) = 0 THEN 0
				 ELSE DATEDIFF(HOUR,@StartDate, @EndDate) END,0)
	        )
END	   

SELECT dbo.udf_HoursToComplete(OpenDate, CloseDate) AS TotalHours
   FROM Reports
