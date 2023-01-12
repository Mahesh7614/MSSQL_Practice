-- Non-Recursive CTE
WITH customer_of_age_Above_25  
AS (SELECT * FROM CustomerTable WHERE Age > 25)  
SELECT *  FROM customer_of_age_Above_25 ; 

-- Recursive CTE
WITH    
odd_num_cte (id, n) AS    
(    
SELECT 1, 1     
UNION ALL    
SELECT id+1, n+2 from odd_num_cte where id < 5     
)    
SELECT * FROM odd_num_cte;  

-- Multiple CTE
WITH customer_of_age_Above_25  
AS (SELECT * FROM CustomerTable WHERE Age > 25),
customer_of_age_Below_25 
AS(SELECT * FROM CustomerTable WHERE Age < 25)
SELECT *  FROM customer_of_age_Above_25
Union All
SELECT *  FROM customer_of_age_Below_25