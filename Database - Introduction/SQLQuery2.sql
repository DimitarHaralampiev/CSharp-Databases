USE Minions

CREATE TABLE People(
ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
[Name] NVARCHAR(200) NOT NULL,
Picture IMAGE,
Height DECIMAL(10,2),
[Weight] DECIMAL(10,2),
GENDER NVARCHAR(1) NOT NULL,
CHECK(GENDER IN ('M', 'F')),
BIRTHDATE DATETIME NOT NULL,
BIOGRAPHY NVARCHAR(MAX)
)

INSERT INTO People([Name], Height, Weight, GENDER, BIRTHDATE)
VALUES 
('Ivan Ivanov', 1.75, 87.20, 'M', '1991-09-17'),
('Петър Стефанов', 1.75, 87.20, 'M', '1996-09-17'),
('Димитър Харалампиев', 1.75, 85.50, 'M', '1991-09-17'),
('Stefan Arnaudov', 1.95, 101.50, 'M', '1991-09-17'),
('Tanq Stefanova', 1.65, 52.20, 'F', '1992-02-22')

SELECT * FROM People