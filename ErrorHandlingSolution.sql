--CHALLENGE 1--
DECLARE @customerID AS INT = 30110;
DECLARE @fname AS NVARCHAR(20);
DECLARE @lname AS NVARCHAR(30);
DECLARE @maxReturns AS INT = 1;
WHILE @maxReturns <= 10
BEGIN
	DECLARE @recordRowCounter int = 0;
	BEGIN TRY
	SELECT @fname = FirstName, @lname = LastName FROM SalesLT.Customer
		WHERE CustomerID = @customerID;
	SET @recordRowCounter = @@ROWCOUNT;
	IF @recordRowCounter = 0
	BEGIN
	DECLARE @customerIDString AS nvarchar(20) = CAST(@customerID as varchar(20))
		RAISERROR(N'no record for this customer with id %s', 
		16,
		9, 
		@customerIDString);
	END	
	END TRY

	BEGIN CATCH
		PRINT ERROR_MESSAGE()
	END CATCH;
	PRINT @fname + N' ' + @lname;
	SET @maxReturns += 1;
	SET @customerID += 1;
END
GO

--CHALLENGE 2--
IF OBJECT_ID('dbo.DisplayErrorDetails') IS NOT NULL
	DROP PROCEDURE DisplayErrorDetails
GO

--GO will reset everything including error line
-- therefore after go line 47 will be treated as line 1, next line (48) will be treated as line 2 and so on
CREATE PROCEDURE dbo.DisplayErrorDetails AS
	PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
	PRINT 'Error Message: ' + ERROR_MESSAGE();
	PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS varchar(10));
	PRINT 'Error State: ' + CAST(ERROR_STATE() AS varchar(10));
	PRINT 'Error Line: ' + CAST(ERROR_LINE() AS varchar(10));
	PRINT 'Error Proc: ' + COALESCE(ERROR_PROCEDURE(), 'Not within procedure');
GO

DECLARE @num varchar(20) = 'Challenge 2';
BEGIN TRY
	PRINT 'Casting: ' + CAST(@num AS numeric(10,4));
END TRY

BEGIN CATCH
	EXEC dbo.DisplayErrorDetails
END CATCH;