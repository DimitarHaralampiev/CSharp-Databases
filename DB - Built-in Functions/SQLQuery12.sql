SELECT CountryName, IsoCode
FROM Countries
WHERE CountryName LIKE '%A%%a%%a%'
ORDER BY IsoCode