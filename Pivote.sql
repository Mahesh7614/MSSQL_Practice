CREATE TABLE pivot_demo    
(    
   Region varchar(45),    
   Year int,    
   Sales int    
)    

INSERT INTO pivot_demo  
VALUES ('North', 2010, 72500),  
('South', 2010, 60500),  
('South', 2010, 52000),  
('North', 2011, 45000),  
('South', 2011, 82500),    
('North', 2011, 35600),  
('South', 2012, 32500),   
('North', 2010, 20500);   

-- Pivot table
SELECT Year, North, South FROM     
(SELECT Region, Year, Sales FROM pivot_demo ) AS Tab1    
PIVOT    
(SUM(Sales) FOR Region IN (North, South)) AS Tab2    
ORDER BY Tab2.Year 


SELECT Region, [2010], [2011], [2012] FROM     -- use interger values in bracket
(SELECT Region, [Year], Sales FROM pivot_demo ) AS Tab1    
PIVOT    
(SUM(Sales) FOR [Year] IN ([2010], [2011], [2012])) AS Tab2  
ORDER BY Tab2.Region;  


select * from pivot_demo
-- Unpivot
DECLARE @Tab TABLE  -- temparary table variable  
(    
   Year int,    
   North varchar(45),  
   South varchar(45)  
)  

INSERT INTO @Tab    
SELECT Year, North, South FROM     
(SELECT Region, Year, Sales FROM pivot_demo ) AS Tab1    
PIVOT    
(SUM(Sales) FOR Region IN (North, South)) AS PivotTable    
ORDER BY PivotTable.Year  

SELECT Region, Year, Sales FROM @Tab    
UNPIVOT    
(    
Sales FOR Region IN (North, South)    
) AS UnpivotTable 


-- Dynamic Pivot Table
CREATE PROCEDURE DynamicPivotTable  
  @PivotColumn NVARCHAR(255),  
  @PivotList NVARCHAR(255)  
AS  
BEGIN  
 DECLARE @Query NVARCHAR(MAX);    
 SET @Query = N'  
    SELECT * FROM (SELECT [Region], [Year], [Sales] FROM pivot_demo) AS tab1  
    PIVOT (SUM([Sales]) FOR ['+@PivotColumn+'] IN ('+@PivotList+')) AS PivotTable';  
  EXEC(@Query)  
END 

EXEC DynamicPivotTable N'Region', N'[North], [South]'  -- execute the store procedure