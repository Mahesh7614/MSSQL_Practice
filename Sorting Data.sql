SELECT
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary -- it will shows in ascending order


SELECT
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
    Salary Desc, -- decending order
	Name ASC  -- ascending order


SELECT
    Name,
    Salary
FROM
    CustomerTable
ORDER BY
	Len(Name) ASC -- it will select ascending order by length of name

