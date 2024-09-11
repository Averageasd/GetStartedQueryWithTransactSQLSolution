SELECT DISTINCT City, StateProvince
FROM SalesLT.Address
ORDER BY City;

SELECT * FROM SalesLT.Product;

SELECT TOP 10 PERCENT WITH TIES Weight , Name FROM SalesLT.Product ORDER BY WEIGHT DESC;

SELECT Name, Color, Size FROM SalesLT.Product WHERE ProductModelID = 1;

SELECT Size, Color, Name, ProductNumber FROM SalesLT.Product WHERE Color IN ('black', 'red', 'white')
AND Size IN ('S', 'M');

SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'BK%'; 

SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';