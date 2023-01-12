-- simple store Procedure
CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        name, 
        Salary
    FROM 
        CustomerTable
    ORDER BY 
        Salary;
END;

EXECUTE uspProductList -- execute store procedure 
EXEC uspProductList  -- execute store procedure

DROP PROCEDURE uspProductList; -- Drop store procedure
DROP PROC uspProductList;  -- Drop store procedure


-- Parameterized store Procedure
CREATE PROCEDURE uspProductList @Salary money, @Age int = 0
AS
BEGIN
    SELECT 
        name, 
		Age,
        Salary
    FROM 
        CustomerTable
		where Salary >= @Salary and Age >= @Age -- Age is optional parameter
    ORDER BY 
        Salary;
END;

EXECUTE uspProductList 1500,29;
EXECUTE uspProductList 1500; -- Age is optional parameter


-- Variable used in Store Procedure
CREATE PROCEDURE uspProductList @Salary money, @Age int = 0
AS
BEGIN
	Declare @Name Varchar(Max)
	Set @Name = 'bsc'
    SELECT 
		@Name = @Name + name + CHAR(10)
    FROM 
        CustomerTable
		where Salary >= @Salary and Age >= @Age -- Age is optional parameter
    ORDER BY 
        Salary;
print @Name
END;

EXECUTE uspProductList 1500,29;


-- Output Parameter
CREATE PROCEDURE uspProductList @Salary money, @Age int = 0, @Count int OUTPUT
AS
BEGIN -- Begin End is batch or set of sql Statements
    SELECT 
		name,
		Salary
    FROM 
        CustomerTable
		where Salary >= @Salary and Age >= @Age -- Age is optional parameter
    ORDER BY 
        Salary;
	Select @Count = @@ROWCOUNT
END;

Declare @RowCount int;
EXECUTE uspProductList 
@Salary = 1500,
@Age = 29,
@Count = @RowCount output
SELECT @RowCount AS 'NO of Rows';


-- if else
CREATE PROCEDURE SP_UpdateName @CustomerID int, @Name varchar (200)
AS
BEGIN -- Begin End is batch or set of sql Statements
	If Exists (Select * from CustomerTable where CustomerID = @CustomerID)
    Begin 
		update CustomerTable set Name = @Name where CustomerID = @CustomerID
	End
	Else
	Begin
		Print 'Please Enter Correct CustomerID'
	End	
END;

EXECUTE SP_UpdateName 4,'Mahesh';

-- While
