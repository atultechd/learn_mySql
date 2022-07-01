
-- Wildcards

-- % = any # characters, _ = one character

-- Find any client' who are an LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC';

+-----------+--------------------+-----------+
| client_id | client_name        | branch_id |
+-----------+--------------------+-----------+
|       403 | John Daly Law, LLC |         3 |
+-----------+--------------------+-----------+

-- Find any brach supplier who are in the label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Label%'

+-----------+---------------------+--------------+
| branch_id | supplier_name       | supply_type  |
+-----------+---------------------+--------------+
|         2 | J.T. Forms & Labels | Custom Forms |
+-----------+---------------------+--------------+

-- Find any employee born in october
SELECT *
FROM employee
WHERE birth_day LIKE '____-10%';

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
+--------+------------+-----------+------------+------+--------+----------+-----------+

-- Find any clients who are schools
SELECT *
FROM client
WHERE client_name LIKE '%school%';

+-----------+--------------------+-----------+
| client_id | client_name        | branch_id |
+-----------+--------------------+-----------+
|       400 | Dunmore Highschool |         2 |
+-----------+--------------------+-----------+