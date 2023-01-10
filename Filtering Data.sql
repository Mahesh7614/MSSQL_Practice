select * from CustomerTable 
-- Distinct
SELECT DISTINCT  -- it will remove duplicate rows
    * FROM CustomerTable

-- Where clause 
SELECT  *
FROM CustomerTable where CustomerID > 1 -- where clause -it will select values according the condition

-- and, or Operator
SELECT * FROM
   CustomerTable where CustomerID > 1  and age >40 or name = 'Avinash' -- and operator -or operator

-- in Operator
SELECT * FROM
    CustomerTable where Salary in(20000,25000)  -- in operator

-- between operator
SELECT * FROM
    CustomerTable where Salary between 20000 and 50000 -- between operator


-- Like Operator
SELECT * FROM
    CustomerTable WHERE name LIKE 'a%' -- it will shows name starts with a
ORDER BY Salary;


SELECT * FROM
    CustomerTable WHERE name LIKE '%sh' -- it will shows name ends with sh
ORDER BY Salary;


SELECT * FROM
    CustomerTable WHERE name LIKE 'a%h' -- it will shows name starts with a and ends with h
ORDER BY Salary;


SELECT * FROM
    CustomerTable WHERE name LIKE '_u%' -- it will shows name having second character is u
ORDER BY Salary;


SELECT * FROM
    CustomerTable WHERE name LIKE '[ya]%'   -- it will shows name starts with y and a
order by Salary;

SELECT * FROM
    CustomerTable WHERE name LIKE '[a-m]%'   -- it will shows name starts within range a to m
order by Salary;


SELECT * FROM
    CustomerTable WHERE name LIKE '[^a-m]%'   -- it will shows name not starts within range a to m
order by Salary;


--Not Like Operator
SELECT * FROM
    CustomerTable WHERE name not LIKE 'a%' -- it will shows name which not starts with a
ORDER BY Salary;

--Like operator with Escape
CREATE TABLE feedbacks (
   feedback_id INT IDENTITY(1, 1) PRIMARY KEY, 
    comment     VARCHAR(255) NOT NULL
);

INSERT INTO feedbacks(comment)
VALUES('Can you give me 30% discount?'),
      ('May I get me 30USD off?'),
      ('Is this having 20% discount today?');


SELECT feedback_id,comment FROM 
	feedbacks WHERE comment LIKE '%30%'; -- it will shows comment that contains 30


SELECT feedback_id,comment FROM 
	feedbacks WHERE comment LIKE '%30!%%' ESCAPE '!' -- it will treat % is as string not a wild card