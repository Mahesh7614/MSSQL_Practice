SELECT DISTINCT  -- it will remove duplicate rows
    *
FROM
    CustomerTable


SELECT  
    *
FROM
    CustomerTable where CustomerID > 1 -- where clause -it will select values according the condition

SELECT  
    *
FROM
    CustomerTable where CustomerID > 1  and age >40 or name = 'Avinash' -- and operator -or operator


SELECT  
    *
FROM
    CustomerTable where Salary in(20000,25000)  -- in operator

SELECT  
    *
FROM
    CustomerTable where Salary between 20000 and 50000 -- between operator


