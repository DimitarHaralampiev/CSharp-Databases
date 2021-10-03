SELECT TOP(3) e.EmployeeID, e.FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS mp ON e.EmployeeID = mp.EmployeeID
WHERE mp.EmployeeID IS NULL
ORDER BY e.EmployeeID 