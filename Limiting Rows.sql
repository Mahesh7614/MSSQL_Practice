create table CustomerTable
(
	CustomerID int Primary key IDENTITY(1,1),
	Name varchar(200),
	Age int,
	Address varchar(500),
	Salary money 
)

Insert into CustomerTable(Name,Age,Address,Salary)
		values('Akashy',25,'Ahamadabad',20000),
			  ('Kasturi',26,'Maharashtra',15000),
			  ('Gaurav',58,'Karnataka',20000),
			  ('Avinash',27,'Delhi',25000),
			  ('Shashank',24,'Mumbai',15000),
			  ('Yuraj',22,'Bhopal',18000)

SELECT
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary DESC,
    Name 
OFFSET 2 ROWS  -- it will skip first 2 rows
FETCH FIRST 4 ROW only -- it will select only first 4 rows


SELECT
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary DESC,
    Name 
OFFSET 2 ROWS  -- it will skip first 2 rows
FETCH Next 3 ROW only -- it will select only next 3 rows


SELECT TOP 3 -- it will select only top 3 rows
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary DESC


SELECT TOP 50 PERCENT -- it will select 50% percent of total rows
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary DESC


SELECT TOP 2 with Ties -- it returned two more products whose salary are the same as the second one.
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary DESC