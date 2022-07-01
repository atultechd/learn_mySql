
-- joins

-- To Join two table's matching column's content
-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

+--------+------------+-------------+
| emp_id | first_name | branch_name |
+--------+------------+-------------+
|    100 | David      | Corporate   |
|    102 | Michael    | Scranton    |
|    106 | Josh       | Stamford    |
+--------+------------+-------------+

-- Join with all elements in the left table's column
-- here "emp_id" and "first_name" are from left table so we are including them too.
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

+--------+------------+-------------+
| emp_id | first_name | branch_name |
+--------+------------+-------------+
|    100 | David      | Corporate   |
|    101 | Jan        | NULL        |
|    102 | Michael    | Scranton    |
|    103 | Angela     | NULL        |
|    104 | Kelly      | NULL        |
|    105 | Stanley    | NULL        |
|    106 | Josh       | Stamford    |
|    107 | Andy       | NULL        |
|    108 | Jim        | NULL        |
+--------+------------+-------------+

-- Join with all elements in the right table's column(we get all rows from right column)
-- here "branch_name" are from right table so we are including them too.
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id

+--------+------------+-------------+
| emp_id | first_name | branch_name |
+--------+------------+-------------+
|    100 | David      | Corporate   |
|    102 | Michael    | Scranton    |
|    106 | Josh       | Stamford    |
|   NULL | NULL       | Atul        |
+--------+------------+-------------+
