SELECT SalesOrderID, Freight FROM SalesLT.SalesOrderHeader;

SELECT 
SalesOrderID, 
Freight, 
LOWER(ShipMethod) AS ShippingMethod FROM SalesLT.SalesOrderHeader;

SELECT 
SalesOrderID, 
Freight, 
LOWER(ShipMethod) AS ShippingMethod,
DATEPART(yy, ShipDate) As ShipYear,
DATENAME(mm, ShipDate) AS ShipMonth,
DATEPART(day, ShipDate) AS ShipDay
FROM SalesLT.SalesOrderHeader;

SELECT prod.Name, Sum(LineTotal) as totalRevenue FROM SalesLT.Product prod 
INNER JOIN SalesLT.SalesOrderDetail sod
ON prod.ProductID = sod.ProductID
GROUP BY prod.Name, prod.ProductID
ORDER BY totalRevenue DESC;

SELECT prod.Name, Sum(LineTotal) as totalRevenue FROM
SalesLT.Product prod
JOIN SalesLT.SalesOrderDetail sod 
ON prod.ProductID = sod.ProductID
WHERE prod.ListPrice > 1000
GROUP BY prod.Name
ORDER BY totalRevenue DESC;

SELECT prod.Name, Sum(LineTotal) as totalRevenue FROM 
SalesLT.Product prod JOIN SalesLT.SalesOrderDetail sod
ON prod.ProductID = sod.ProductID
GROUP BY prod.Name
HAVING Sum(LineTotal) > 20000
ORDER BY prod.Name;




