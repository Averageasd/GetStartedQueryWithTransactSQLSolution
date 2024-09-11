--all select challenges--

--all columns in customer table
SELECT * FROM SalesLT.Customer;

--Create a list of all customer 
--contact names that includes the title, first name, middle name (if any), last name, 
--and suffix (if any) of all customers
SELECT 
Title, 
FirstName, 
MiddleName,
LastName,
Suffix
FROM SalesLT.Customer;

SELECT SalesPerson,
CASE
	WHEN Title IS NOT NULL THEN Title + ' ' + LastName
	ELSE LastName
END
AS CustomerName,
Phone
FROM SalesLT.Customer WHERE Title is NULL;


SELECT CAST(CustomerID AS varchar) + ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

SELECT * FROM SalesLT.SalesOrderHeader;

SELECT 'SO' + CONVERT(varchar(15), SalesOrderID) + ' (' + STR(RevisionNumber,1) + ')' FROM 
SalesLT.SalesOrderHeader;

SELECT CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate FROM SalesLT.SalesOrderHeader;

SELECT FirstName + ' ' + COALESCE(MiddleName + ' ', '') + LastName FROM SalesLT.Customer;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact 
FROM SalesLT.Customer;

SELECT * FROM SalesLT.SalesOrderHeader;

SELECT SalesOrderID, 
CASE 
	WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
	ELSE 'Shipped'
END ShippingStatus
FROM SalesLT.SalesOrderHeader;

