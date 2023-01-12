CREATE TABLE production_parts(
    part_id   INT not null, 
    part_name VARCHAR(100)
);
INSERT INTO 
    production_parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (5,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (2,'Fork');


-- Clustered index
CREATE CLUSTERED INDEX ix_parts_id
ON production_parts (part_id);  

--drop table production_parts
-- Non Clustered Index
CREATE NONCLUSTERED INDEX ix_parts_name
ON production_parts (part_name);  

select * from production_parts


-- Rename indexes

EXEC sp_rename 
        @objname = N'production_parts.ix_parts_name',
        @newname = N'ix_cust_city',
        @objtype = N'INDEX';   -- it shows warning Changing any part of an object name could break scripts and stored procedures.


-- Disable index
ALTER INDEX ix_parts_name -- for perticular index
ON production_parts 
DISABLE;

ALTER INDEX ALL ON production_parts  -- For all index
DISABLE;


-- Enable Index
ALTER INDEX ix_parts_name -- for perticular index
ON production_parts  
REBUILD;

ALTER INDEX ALL ON production_parts -- For all index
REBUILD;

CREATE INDEX ix_parts_name  -- it enable the disabled index and recreate it
ON production_parts(part_name)
WITH(DROP_EXISTING=ON)


-- unique index
CREATE UNIQUE INDEX ix_unique_name 
ON production_parts(part_name);

-- drop index
DROP INDEX IF EXISTS ix_parts_name
ON production_parts;


-- index with included column
CREATE nonclustered INDEX ix_cust_email_inc
ON production_parts(email)
INCLUDE(Fisrtname,LastName);

-- Filtered index
CREATE INDEX ix_cust_email
ON production_parts(email)
WHERE email IS NOT NULL;


