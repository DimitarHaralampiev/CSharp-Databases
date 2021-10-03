SELECT DISTINCT SUBSTRING(FirstName, 1, 1) AS FirstLetter
FROM WizzardDeposits
GROUP BY FirstName, DepositGroup
HAVING DepositGroup = 'Troll Chest'

