CREATE TABLE candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);


INSERT INTO 
    candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');


INSERT INTO 
    employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

-- inner join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    candidates c
    INNER JOIN employees e 
        ON e.fullname = c.fullname;


-- left join 
SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	candidates c
	LEFT JOIN employees e 
		ON e.fullname = c.fullname;

-- right join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    candidates c
    RIGHT JOIN employees e 
        ON e.fullname = c.fullname;

-- full join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    candidates c
    FULL JOIN employees e 
        ON e.fullname = c.fullname;