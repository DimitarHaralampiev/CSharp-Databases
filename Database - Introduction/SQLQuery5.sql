CREATE DATABASE Movies

CREATE TABLE Directors(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Genres(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Categories(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
CategoryName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Movies(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
Title NVARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear CHAR(4),
[Length] CHAR(3) NOT NULL,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating DECIMAL(4,2),
Notes NVARCHAR(MAX),
FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
FOREIGN KEY (GenreId) REFERENCES Genres(Id)
)

INSERT INTO Directors(DirectorName)
VALUES
('Ivan Ivanov'),
('Iliq Iliev'),
('Stefan Stefanov'),
('Tanq Stefanova'),
('Dimitar Petrov')

INSERT INTO Genres(GenreName)
VALUES
('Horor'),
('Thriller'),
('Action'),
('Comedy'),
('Fiction')

INSERT INTO Categories(CategoryName)
VALUES
('Recommended for people over 18'),
('Recommended for people over 18'),
('Recommended for people over 16'),
('Recommended for people over 16'),
('Recommended for people over 16')

INSERT INTO Movies(Title, DirectorId, [Length], GenreId, CategoryId)
VALUES
('The Grudge', 1, '120', 1, 5),
('I See You (2019)', 2, '90', 2, 4),
('Holidate', 3, '87', 4, 3),
('Extraction', 4, '110', 3, 4),
('Under the skin', 5, '100', 5, 5)
