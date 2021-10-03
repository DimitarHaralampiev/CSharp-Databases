SELECT DepartmentID, MAX(Salary) AS MaxSalary
FROM Employees AS e
GROUP BY DepartmentID
HAVING MAX(Salary) > 70000 OR MAX(Salary) < 30000