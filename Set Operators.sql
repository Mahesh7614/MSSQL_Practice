-- Union ALL -- gives all values with duplicate values
SELECT name FROM CustomerTable
Union ALL
SELECT name FROM CUSTOMER_BKP

-- INTERSECT -- 
SELECT name FROM CustomerTable
Intersect
SELECT name FROM CUSTOMER_BKP

-- EXCEPT
SELECT name FROM CustomerTable
Except
SELECT name FROM CUSTOMER_BKP