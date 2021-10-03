SELECT TownID, [Name]
FROM Towns
WHERE [Name] LIKE 'M%' 
OR [Name] LIKE 'B%' 
OR [Name] LIKE 'E%' 
OR [Name] LIKE 'K%'
ORDER BY [Name]