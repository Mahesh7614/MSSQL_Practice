SELECT
 customerID,Salary FROM CustomerTable group by CustomerID, Salary -- it will group by CustomerID and Salary -it is also called as grouping sets

 SELECT count(customerID) 'IDcount', Salary FROM 
	CustomerTable group by Salary Having Count(customerID) > 1 -- having clause is used to give condition -it is only used with Group by clause
 

-- Grouping Sets
CREATE TABLE ProductQty(  
 Id INT IDENTITY(1,1),  
 Region VARCHAR(100),  
 Product VARCHAR(50),  
 Year INT,  
 Quantity INT  
)

INSERT INTO ProductQty(Region, Product, Year, Quantity)  
VALUES('East', 'Computer', 2020, 13000),  
('South', 'Computer', 2020, 45000),  
('North', 'Computer', 2020, 25000),  
('East', 'Hard Disk', 2020, 1900),  
('West', 'Computer', 2021, 25000),  
('South', 'Hard Disk', 2021, 5500),  
('West', 'Hard Disk', 2021, 6500),  
('East', 'Pen Drive', 2021, 1200),  
('North', 'Mouse', 2019, 1600),  
('South', 'Pen Drive', 2019, 2700),  
('East', 'Mouse', 2019, 2000),  
('West', 'Pen Drive', 2019, 1900); 

SELECT Region, SUM(Quantity) AS TotalPurchase   
FROM ProductQty   
GROUP BY Region;  -- group by on single column

SELECT Year, SUM(Quantity) AS TotalPurchase   
FROM ProductQty   
GROUP BY Year; -- group by on single column

SELECT Region, Year, SUM(Quantity) AS TotalPurchase   
FROM ProductQty   
GROUP BY Region, Year; --group by on two column

-- Grouping sets
SELECT Region, Year, SUM(Quantity) AS TotalPurchaseQty    
FROM ProductQty   
GROUP BY GROUPING SETS  -- group by column sets with single query
((Region),   
(Year),   
(Region, Year),   
())   
ORDER BY Region, Year; 

-- cube
SELECT Region, Year, SUM(Quantity) AS TotalPurchaseQty    
FROM ProductQty   
GROUP BY cube(Region, Year)  -- cube is used with group by on two column
-- cube gives Groping sets ((Region),(Year),(Region, Year),())
ORDER BY Region, Year;

-- Rollup
SELECT Region, Year, SUM(Quantity) AS TotalPurchaseQty    
FROM ProductQty   
GROUP BY Rollup(Region, Year)  -- cube is used with group by on two column
-- Rollup gives Groping sets ((Region),(Region, Year),())
ORDER BY Region, Year;

