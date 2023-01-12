select * from CustomerTable

-- Create View
CREATE VIEW CUSTOMERS_VIEW AS
SELECT name, age
FROM  CustomerTable

SELECT * FROM CUSTOMERS_VIEW

-- Update View
UPDATE CUSTOMERS_VIEW
   SET AGE = 35
   WHERE name = 'Yuraj' -- it update the in view as well as in table

-- Insert Row in View
insert into CUSTOMERS_VIEW
(name,age) values('Mahesh',25)

-- Delete row in View
DELETE FROM CUSTOMERS_VIEW
   WHERE age = 25

-- Rename View
EXEC sp_rename 
    @objname = 'CUSTOMERS_VIEW',
    @newname = 'CUSTOMER_VIEW' -- it shows warning Changing any part of an object name could break scripts and stored procedures.


-- Listing All views 
SELECT 
  TABLE_SCHEMA,
  TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS;


-- Getting information about view
EXEC sp_helptext 'dbo.CUSTOMER_VIEW' 

SELECT 
    OBJECT_DEFINITION(
        OBJECT_ID(
            'CUSTOMER_VIEW'
        )
    ) view_info;

-- Removing View
DROP VIEW IF EXISTS CUSTOMER_VIEW