
-- Union

-- Find a list of employee and branch names using "union" query
-- union makes this in a single column
SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch;

+------------+
| first_name |
+------------+
| David      |
| Jan        |
| Michael    |
| Angela     |
| Kelly      |
| Stanley    |
| Josh       |
| Andy       |
| Jim        |
| Corporate  |
| Scranton   |
| Stamford   |
+------------+

-- Find a list of all money spent or earned by the company
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

+--------+
| salary |
+--------+
| 250000 |
| 110000 |
|  75000 |
|  63000 |
|  55000 |
|  69000 |
|  78000 |
|  65000 |
|  71000 |
| 267000 |
|  15000 |
|  33000 |
| 130000 |
|   5000 |
|  26000 |
|  22500 |
|  12000 |
+--------+
s