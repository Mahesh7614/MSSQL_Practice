create database PracticeDB -- to create database
use PracticeDB -- select database for use

EXEC sp_databases -- shows List of databse

DROP DATABASE IF EXISTS PracticeDB -- To delete databse

CREATE SCHEMA customer_services  -- create schema 
GO

CREATE TABLE customer_services.jobs(   
    job_id INT PRIMARY KEY IDENTITY,
    customer_id INT NOT NULL,
    description VARCHAR(200),
    created_at DATETIME NOT NULL
)                                  -- create table in schema

CREATE TABLE dbo.offices    -- create another table in dbo schema
(
    office_id      INT
    PRIMARY KEY IDENTITY, 
    office_name    NVARCHAR(40) NOT NULL, 
    office_address NVARCHAR(255) NOT NULL, 
    phone          VARCHAR(20),
);


ALTER SCHEMA customer_services TRANSFER OBJECT::dbo.offices -- Move table from one schema to another schema

DROP table IF EXISTS customer_services.jobs -- drop table from the schema
DROP table IF EXISTS customer_services.offices -- drop table from the schema

DROP SCHEMA IF EXISTS customer_services -- drop schema


CREATE TABLE visits (
    visit_id INT PRIMARY KEY IDENTITY (1, 1), -- identity (seed, increment) seed- value of 1st row loaded in table, increment- incremental value added to the identity value of the previous row 
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    visited_at DATETIME,
    phone VARCHAR(20),
    store_id INT NOT NULL,
);                             -- create table in database


CREATE SEQUENCE customer_services.order_number  -- create sequence we can use max and min value also for sequence
AS INT
START WITH 1
INCREMENT BY 1;

CREATE TABLE customer_services.purchase_orders(
    order_id INT PRIMARY KEY,
    vendor_id int NOT NULL,
    order_date date NOT NULL
);                               -- table created

exec sp_help 'customer_services.purchase_orders' -- to view details of the table

INSERT INTO customer_services.purchase_orders
    (order_id,
    vendor_id,
    order_date)
VALUES
    (NEXT VALUE FOR customer_services.order_number,1,'2019-04-30');  -- insert query to add data in table


INSERT INTO customer_services.purchase_orders
    (order_id,
    vendor_id,
    order_date)
VALUES
    (NEXT VALUE FOR customer_services.order_number,2,'2019-05-01'); -- we can use sequence like that 

SELECT * FROM  customer_services.purchase_orders; -- select query for display data in tables

drop table customer_services.purchase_orders -- to delete table

CREATE TABLE customer_services.purchase_orders(
    order_id INT PRIMARY KEY DEFAULT (NEXT VALUE FOR customer_services.order_number), -- we can use sequence also like that
    vendor_id int NOT NULL,
    order_date date NOT NULL
); 

INSERT INTO customer_services.purchase_orders
    ( vendor_id, order_date) VALUES (2,'2019-05-01');

SELECT * FROM sys.sequences -- getting details of sequences

drop table customer_services.purchase_orders -- we can delete multiple tables also by separating their names by comma


CREATE TABLE customer_services.customer_groups (
    group_id INT PRIMARY KEY IDENTITY(1,1),
    group_name VARCHAR (50) NOT NULL
);

INSERT INTO customer_services.customer_groups (group_name)
VALUES('Intercompany'),('Third Party'),('One time');  -- add multiple rows at a time

DELETE FROM customer_services.customer_groups; -- it will delete all rows but cannot reset indentity

Select * from customer_services.customer_Group

TRUNCATE TABLE customer_services.customer_groups; -- it will delete all rows and reset identity

ALTER TABLE customer_services.customer_groups 
ADD description VARCHAR (255);        -- to add column after table created

ALTER TABLE customer_services.customer_groups ALTER COLUMN description VARCHAR (200); -- modify table column

ALTER TABLE customer_services.customer_groups ALTER COLUMN description VARCHAR (200) not null -- add constriants

EXEC sp_rename 'customer_services.customer_groups', 'customer_Group';  -- rename table

EXEC sp_rename 'customer_services.customer_group.group_name', 'name', 'COLUMN'; -- rename column

ALTER TABLE customer_services.customer_group
ADD full_name AS (name + ' ' + description)PERSISTED;   -- compute column

alter table customer_services.customer_group drop column full_name; -- drop column

-- temporary table using create table

CREATE TABLE ##haro_products ( -- Global temporary table
    product_name VARCHAR(MAX),
    list_price DEC(10,2)
);

-- temporary table using Select into
SELECT
    name,
    description
INTO #trek_products -- local temporary table
FROM
    customer_services.customer_group
WHERE
    group_id = 1;

select * from #trek_products


Create synonym customer for customer_services.customer_group  -- to create synonym

select * from customer -- display table data using synonym

DROP SYNONYM IF EXISTS customer; -- delete synonym

SELECT * INTO customer_services.customer FROM  customer_services.customer_group; --create new table using select into

SELECT * from customer_services.customer -- new table created