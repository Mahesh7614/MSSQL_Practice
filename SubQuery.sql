-- Select Using SubQuery
SELECT * 
   FROM CustomerTable 
   WHERE CustomerID IN (SELECT CustomerID 
         FROM CustomerTable 
         WHERE SALARY > 15000) ; 

Create Table Customer_BKP
( CustomerID int Identity(1,1) Primary Key,
	Name varchar(200),
	Age int ,
	address varchar(500),
	Salary money
)

-- Insert into Using Subquery
INSERT INTO Customer_BKP
   SELECT name,age,Address,Salary FROM CustomerTable 
   WHERE CustomerID IN (SELECT CustomerID 
   FROM CustomerTable);

select * from Customer_BKP

 -- Update Using SubQuery
 UPDATE CustomerTable
   SET SALARY = SALARY * 0.25
   WHERE AGE IN (SELECT AGE FROM CUSTOMER_BKP
      WHERE AGE = 58 );

-- Delete Using Subquery
DELETE FROM CustomerTable
   WHERE AGE IN (SELECT AGE FROM CUSTOMER_BKP
      WHERE AGE = 58)


-- Correlated Subquery is subquery that uses the values of the outer query
SELECT
    name,
    Salary,
    CustomerID
FROM
    CustomerTable c1
WHERE
    Salary IN (
        SELECT
            MAX (c2.Salary)
        FROM
            CUSTOMER_BKP c2
        WHERE
            c2.CustomerID = c1.CustomerID
        GROUP BY
            c2.CustomerID
    )
ORDER BY
    CustomerID,
    name;


-- Exists
SELECT
    name,
    Salary,
    CustomerID
FROM
    CustomerTable c1
WHERE
    Exists (
        SELECT
            CustomerID
        FROM
            CUSTOMER_BKP c2
        WHERE
            c2.CustomerID = c1.CustomerID
        GROUP BY
            c2.CustomerID
    )
ORDER BY
    CustomerID,
    name;


-- ANY
SELECT name, Salary
FROM CustomerTable
WHERE CustomerID = ANY
  (SELECT CustomerID
  FROM CUSTOMER_BKP
  WHERE Salary > 15000)

-- ALL
SELECT name, Salary
FROM CustomerTable
WHERE CustomerID = ALL
  (SELECT CustomerID
  FROM CUSTOMER_BKP
  WHERE Salary > 15000)