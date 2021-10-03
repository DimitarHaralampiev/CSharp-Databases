USE Minions

CREATE TABLE Users(
Id BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(27) NOT NULL,
ProfilePictures VARBINARY(MAX),
CHECK (ProfilePictures <= 900000),
LastLoginTime DATETIME,
IsDeleted BIT NOT NULL
)

INSERT INTO Users(Username, [Password], IsDeleted)
VALUES
('Pesho Goshov', 'goshov123', 0),
('Stamen Stamenov', 'stStamenov', 1),
('Iliq Iliev', 'iliqta', 0),
('Petar Petrov', 'petrov', 0),
('Dimitar Georgiev', 'mitaka34', 1)

SELECT * FROM Users