CREATE TABLE Manufacturers(
ManufacturerID INT PRIMARY KEY NOT NULL IDENTITY,
[Name] VARCHAR(20) NOT NULL,
EstablishedOn VARCHAR(10) NOT NULL
)

CREATE TABLE Models(
ModelID INT PRIMARY KEY NOT NULL IDENTITY (101, 1),
[Name] VARCHAR(20) NOT NULL,
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID) NOT NULL
)

INSERT INTO Manufacturers([Name], EstablishedOn)
VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

INSERT INTO Models([Name], ManufacturerID)
VALUES
('X1', 1),
('i6', 1),
('Models S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)

