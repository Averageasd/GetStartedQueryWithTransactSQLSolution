SELECT * FROM SalesLT.Customer;

SELECT CompanyName, SalesOrderID, TotalDue FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader so
ON c.CustomerID = so.CustomerID;

SELECT c.CustomerID, ca.AddressID, AddressType, AddressLine1, AddressLine2, City, StateProvince, PostalCode, CountryRegion, CompanyName, SalesOrderID, TotalDue FROM 
SalesLT.Customer c INNER JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address ad
ON ca.AddressID = ad.AddressID
INNER JOIN SalesLT.SalesOrderHeader so
ON c.CustomerID = so.CustomerID
WHERE AddressType = 'Main Office';

SELECT c.CustomerID, c.CompanyName, c.FirstName, c.LastName, so.SalesOrderID, so.TotalDue FROM
SalesLT.Customer c LEFT OUTER JOIN SalesLT.SalesOrderHeader so
ON c.CustomerID = so.CustomerID
ORDER BY CASE
	WHEN so.SalesOrderID IS NULL THEN 1
	ELSE 0
END ASC;

SELECT c.CustomerID, c.CompanyName, c.FirstName, c.LastName
FROM SalesLT.Customer c LEFT OUTER JOIN SalesLT.CustomerAddress ca 
ON c.CustomerID = ca.CustomerID 
WHERE ca.AddressID IS NULL;


SELECT 
parentCategory.Name as parentCategoryName, category.Name as categoryName, prod.Name FROM 
SalesLT.ProductCategory category 
LEFT OUTER JOIN SalesLT.ProductCategory parentCategory
ON category.ParentProductCategoryID = parentCategory.ProductCategoryID
RIGHT OUTER JOIN SalesLT.Product prod ON prod.ProductCategoryID = category.ProductCategoryID
OR prod.ProductCategoryID = category.ParentProductCategoryID
Order BY parentCategoryName, categoryName, prod.Name;