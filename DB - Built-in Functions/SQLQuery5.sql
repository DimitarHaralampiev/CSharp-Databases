SELECT [Name] 
FROM Towns
WHERE LEN([Name]) = 6 OR LEN([Name]) = 5
ORDER BY [Name] ASC