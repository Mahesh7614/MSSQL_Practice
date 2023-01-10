
CREATE TABLE customer_services.activities (
    activity_id INT PRIMARY KEY IDENTITY,  -- primary key -it is unique, it does not accept null values, one table can have only one primary key,Based on Primary key you can join two or more tables
    activity_name VARCHAR (255) NOT NULL, -- not null constraints it won't allows null values
    activity_date DATE unique not null, -- unique -it should not allow duplicate values, it allows only one null value
	activity_organizer varchar(500) default ('Unknown'), -- default is used to give default value to column
	activity_amount money check(activity_amount > 5000), -- check -it is used to apply condition on column
	group_id int foreign key References customer_services.customer_group(group_id), 
);
-- foreign key 
-- it allows duplicate values
-- one table have multiple foreign keys
-- foreign key is used to join two tables using primary key column
