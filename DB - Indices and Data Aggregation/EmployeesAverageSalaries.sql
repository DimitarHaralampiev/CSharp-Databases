SELECT * INTO EmployeesAs 
FROM Employees
WHERE Salary > 30000

DELETE FROM EmployeesAs
WHERE ManagerID = 42

UPDATE EmployeesAs
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AverageSalary 
FROM EmployeesAs
GROUP BY DepartmentID