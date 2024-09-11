--note: please uncomment and run each set of sql commands at a time.
-- after finishing executing current set of statements, comment it out. 

----challenge 1 q1
--INSERT INTO SalesLT.Product(
--Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate
--)
--VALUES ('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());
--SELECT IDENT_CURRENT('SalesLT.Product') AS LastIntertedProdID;
--SELECT Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate
--FROM SalesLT.Product prod WHERE ProductID = 1000;

----challenge 1 q2
--INSERT INTO SalesLT.ProductCategory(ParentProductCategoryID, Name)
--VALUES(
--	4, 'Bells and Horns'
--);
--SELECT * FROM SalesLT.ProductCategory;
--SELECT IDENT_CURRENT('SalesLT.ProductCategory') AS LastInsertedCategoryID;
--INSERT INTO SalesLT.Product(Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
--VALUES
--('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE()),
--('Bicycle Horn', 'BB-PARP', 1.29, 3.75, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE());
--SELECT * FROM SalesLT.Product prod WHERE prod.ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');
--SELECT Name, ListPrice From SalesLT.Product prod WHERE ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');

----challenge 2 q1
--UPDATE SalesLT.Product
--SET ListPrice = ListPrice + (ListPrice * 10 / 100)
--WHERE ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');
--SELECT Name, ListPrice From SalesLT.Product prod WHERE ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');

----challenge 2 q2
--UPDATE SalesLT.Product 
--SET DiscontinuedDate = GETDATE()
--WHERE ProductCategoryID = 37
--AND ProductID != IDENT_CURRENT('SalesLT.Product');
--SELECT Name, DiscontinuedDate FROM SalesLT.Product 
--WHERE ProductCategoryID = 37;

----challenge 3
--SELECT * FROM SalesLT.Product WHERE ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');
--DELETE FROM SalesLT.Product WHERE ProductCategoryID = (SELECT 
--ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');

--DELETE FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns';

--SELECT * FROM SalesLT.Product WHERE ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');
--SELECT * FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns';