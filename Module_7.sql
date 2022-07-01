
-- Some more basic queries .......................................

-- Find all employees
SELECT * FROM employee

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    102 | Michael    | Scott     | 1964-03-15 | M    |  75000 |      100 |         2 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |      102 |         2 |
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |      102 |         2 |
|    105 | Stanley    | Hudson    | 1958-02-19 | M    |  69000 |      102 |         2 |
|    106 | Josh       | Porter    | 1969-09-05 | M    |  78000 |      100 |         3 |
|    107 | Andy       | Bernard   | 1973-07-22 | M    |  65000 |      106 |         3 |
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
+--------+------------+-----------+------------+------+--------+----------+-----------+

-- Fetch client table
SELECT * FROM client;

+-----------+---------------------+-----------+
| client_id | client_name         | branch_id |
+-----------+---------------------+-----------+
|       400 | Dunmore Highschool  |         2 |
|       401 | Lackawana Country   |         2 |
|       402 | FedEx               |         3 |
|       403 | John Daly Law, LLC  |         3 |
|       404 | Scranton Whitepages |         2 |
|       405 | Times Newspaper     |         3 |
|       406 | FedEx               |         2 |
+-----------+---------------------+-----------+

-- This will give "employee" table but "salary" column in ascending order
SELECT * 
FROM employee
ORDER BY salary;

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |      102 |         2 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |      102 |         2 |
|    107 | Andy       | Bernard   | 1973-07-22 | M    |  65000 |      106 |         3 |
|    105 | Stanley    | Hudson    | 1958-02-19 | M    |  69000 |      102 |         2 |
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
|    102 | Michael    | Scott     | 1964-03-15 | M    |  75000 |      100 |         2 |
|    106 | Josh       | Porter    | 1969-09-05 | M    |  78000 |      100 |         3 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
+--------+------------+-----------+------------+------+--------+----------+-----------+

-- Limit is five here
SELECT * 
FROM employee
LIMIT 5;

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    102 | Michael    | Scott     | 1964-03-15 | M    |  75000 |      100 |         2 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |      102 |         2 |
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |      102 |         2 |
+--------+------------+-----------+------------+------+--------+----------+-----------+

-- Find the first and last name of all employee
SELECT first_name, last_name
FROM employee;

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| David      | Wallace   |
| Jan        | Levinson  |
| Michael    | Scott     |
| Angela     | Martin    |
| Kelly      | Kapoor    |
| Stanley    | Hudson    |
| Josh       | Porter    |
| Andy       | Bernard   |
| Jim        | Halpert   |
+------------+-----------+

-- This will change "first_name" to "forename" and "last_name" to "surname"
SELECT first_name AS forename, last_name AS surname
FROM employee;

+----------+----------+
| forename | surname  |
+----------+----------+
| David    | Wallace  |
| Jan      | Levinson |
| Michael  | Scott    |
| Angela   | Martin   |
| Kelly    | Kapoor   |
| Stanley  | Hudson   |
| Josh     | Porter   |
| Andy     | Bernard  |
| Jim      | Halpert  |
+----------+----------+

-- Find out all different genders
SELECT DISTINCT sex 
FROM employee;

+------+
| sex  |
+------+
| M    |
| F    |
+------+

-- Find out all different branch IDs
SELECT DISTINCT branch_id 
FROM employee;

+-----------+
| branch_id |
+-----------+
|         1 |
|         2 |
|         3 |
+-----------+

-- Find the number of employees
SELECT COUNT(emp_id)
FROM employee;

+---------------+
| COUNT(emp_id) |
+---------------+
|             9 |
+---------------+

-- Find the number of superwiser
SELECT COUNT(super_id)
FROM employee;

+-----------------+
| COUNT(super_id) |
+-----------------+
|               8 |
+-----------------+

-- Find the number of female employees born after 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1971-12-31';

+---------------+
| COUNT(emp_id) |
+---------------+
|             1 |
+---------------+

-- Find the average of all employee's salaries
SELECT AVG(salary)
FROM employee;

+-------------+
| AVG(salary) |
+-------------+
|  92888.8889 |
+-------------+

-- Find avg of Men
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';

+-------------+
| AVG(salary) |
+-------------+
| 101333.3333 |
+-------------+

--Find the Sum of all employee's salary
SELECT SUM(salary)
FROM employee;

+-------------+
| SUM(salary) |
+-------------+
|      836000 |
+-------------+

-- Find out how many males and females there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

+------------+------+
| COUNT(sex) | sex  |
+------------+------+
|          6 | M    |
|          3 | F    |
+------------+------+

-- Find the total sales of each salesman
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

+------------------+--------+
| SUM(total_sales) | emp_id |
+------------------+--------+
|           282000 |    102 |
|           218000 |    105 |
|            31000 |    107 |
|            34500 |    108 |
+------------------+--------+

-- Find how much each client is spending
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

+------------------+-----------+
| SUM(total_sales) | client_id |
+------------------+-----------+
|            55000 |       400 |
|           267000 |       401 |
|            22500 |       402 |
|            17000 |       403 |
|            33000 |       404 |
|            26000 |       405 |
|           145000 |       406 |
+------------------+-----------+