CREATE TABLE Employee  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT  
)  

INSERT INTO Employee VALUES (1,'Steffan', 82000, 'Male', 3),  
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3)  


SELECT * FROM Employee;

CREATE TABLE Employee_Audit_Test  
(    
Id int IDENTITY,   
Audit_Action varchar(8000)   
) 

-- FOR or AFTER Trigger to do insert operation
CREATE TRIGGER trInsertEmployee   
ON Employee  
FOR INSERT  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
END

INSERT INTO Employee VALUES (6,'Peter', 62000, 'Male', 3)  

select * from Employee_Audit_Test

-- FOR or AFTER Trigger to do Delete operation
CREATE TRIGGER trDeleteEmployee   
ON Employee  
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from deleted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

DELETE FROM Employee WHERE Id = 2;  


-- INSTEAD OF Trigger to do insert operation
CREATE TRIGGER trInsertEmployeeINSTEADOF   
ON Employee  
INSTEAD OF INSERT  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
END

INSERT INTO Employee VALUES (6,'Peter', 62000, 'Male', 3)  


-- DDL Triggers
CREATE TABLE index_logs (
    log_id INT IDENTITY PRIMARY KEY,
    event_data XML NOT NULL,
    changed_by SYSNAME NOT NULL
);

CREATE TRIGGER trg_index_changes
ON DATABASE
FOR	
    CREATE_INDEX,
    ALTER_INDEX, 
    DROP_INDEX
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO index_logs (
        event_data,
        changed_by
    )
    VALUES (
        EVENTDATA(),
        USER
    );
END;

CREATE NONCLUSTERED INDEX nidx_fname
ON Employee(name);

select * from index_logs


-- Disable Triggers
DISABLE TRIGGER trInsertEmployee 
ON Employee;

DISABLE TRIGGER all 
ON Employee;

DISABLE TRIGGER ALL ON DATABASE;  -- disable all triggers on database 

-- Enable Trigger
Enable TRIGGER trInsertEmployee 
ON Employee;

Enable TRIGGER all 
ON Employee;

Enable TRIGGER ALL ON DATABASE;  -- Enable all triggers on database


-- Getting Definition of Trigger
EXEC sp_helptext 'trInsertEmployee'

SELECT 
    OBJECT_DEFINITION (
        OBJECT_ID(
            'trInsertEmployee'
        )
    ) AS trigger_definition;

SELECT 
    definition   
FROM 
    sys.sql_modules  
WHERE 
    object_id = OBJECT_ID('trInsertEmployee'); 


-- Listing all Triggers
SELECT  
    name,
    is_instead_of_trigger
FROM 
    sys.triggers  
WHERE 
    type = 'TR';


-- Removing Triggers
DROP TRIGGER IF EXISTS trg_index_changes;