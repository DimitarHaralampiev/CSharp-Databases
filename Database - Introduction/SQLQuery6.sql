CREATE DATABASE CarRental

CREATE TABLE Categories(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
CategoryName NVARCHAR(30) NOT NULL,
DailyRate CHAR(2),
WeeklyRate CHAR(3),
MonthlyRate CHAR(4),
WeekendRate CHAR(2)
)

CREATE TABLE Cars(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
PlateNumber NVARCHAR(10) NOT NULL,
Manufacturer NVARCHAR(20),
Model NVARCHAR(20) NOT NULL,
CarYear CHAR(4) NOT NULL,
CategoriId INT NOT NULL,
Doors CHAR(1) NOT NULL,
Pictures IMAGE,
Condition NVARCHAR(10),
Available NVARCHAR(2)
)

CREATE TABLE Employees(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
FirstName NVARCHAR(10) NOT NULL,
LastName NVARCHAR(10) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Customers(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
DriverLicenceNumber NVARCHAR(10) NOT NULL,
FullName NVARCHAR(50) NOT NULL,
[Address] NVARCHAR(50) NOT NULL,
City NVARCHAR(20) NOT NULL,
ZIPCode NVARCHAR(4),
Notes NVARCHAR(MAX)
)

CREATE TABLE RentalOrders(
Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
TankLevel NVARCHAR(4),
KilometrageStart NVARCHAR(7),
KilometrageEnd NVARCHAR(7),
TotalKilometrage NVARCHAR(7),
StartDate DATETIME,
EndDate DATETIME,
TotalDays NVARCHAR(3),
RateApplied NVARCHAR(10),
TaxRate NVARCHAR(10),
OrderStatus NVARCHAR(10),
Notes NVARCHAR(MAX),
FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
FOREIGN KEY (CarId) REFERENCES Cars(Id)
)

INSERT INTO Categories(CategoryName)
VALUES
('Car'),
('Truck'),
('Motorcycle')

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoriId, Doors)
VALUES
('SO7065VT', 'BMW', 'E60', '2006', 1, '5'),
('SO7565VT', 'Audi', 'A4', '2006', 1, '5'),
('SA6065VT', 'Mercedes', 'E270', '2010', 1, '5')

INSERT INTO Employees(FirstName, LastName)
VALUES
('Ivan', 'Ivanov'),
('Dimitar', 'Georgiev'),
('Stamen', 'Stamenov')

INSERT INTO Customers(DriverLicenceNumber, FullName, [Address], City)
VALUES
('2342897325', 'Ivan Ivanov', 'Mladost 3', 'Sofia'),
('2342897326', 'Stamen Stamenov', 'V.Levski', 'Botevgrad'),
('2342897327', 'Dimitar Georgiev', 'Mladost 1', 'Sofia')

INSERT INTO RentalOrders
(EmployeeId, CustomerId, CarId, TankLevel, RateApplied, TaxRate, OrderStatus)
VALUES
(1, 1, 1, 'Full', '10', '2555', 'Busy'),
(2, 2, 2, 'Full', '15', '3000', 'Busy'),
(3, 3, 3, 'Full', '10', '2555', 'Busy')
