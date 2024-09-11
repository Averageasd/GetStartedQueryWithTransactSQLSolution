SELECT ProductID, Name, ListPrice FROM SalesLT.Product prod
WHERE prod.ListPrice > (Select AVG(UnitPrice) FROM SalesLT.SalesOrderDetail);

SELECT ProductID, Name, ListPrice FROM SalesLT.Product prod WHERE ListPrice >= 100 AND ProductID IN 
(SELECT ProductID FROM SalesLT.SalesOrderDetail WHERE UnitPrice < 100);

SELECT * FROM (SELECT ProductID, Name, ListPrice, 
	(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail sod WHERE sod.ProductID = prod.ProductID) AS avgPrice
		FROM SalesLT.Product AS prod
	)AS prodWithAvgPrice;

SELECT * FROM (SELECT ProductID, Name, StandardCost, ListPrice, 
	(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail sod WHERE sod.ProductID = prod.ProductID) AS avgPrice
		FROM SalesLT.Product AS prod
	)AS prodWithAvgPrice 
		WHERE prodWithAvgPrice.StandardCost > avgPrice 
		ORDER BY ProductID;