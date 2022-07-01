
-- Nested queries

-- Find emp_id of all employees who have sold 
-- over 30000 to a single client
SELECT works_with.emp_id
FROM works_with
WHERE works_with.total_sales >30000;

+--------+
| emp_id |
+--------+
|    102 |
|    105 |
|    105 |
|    105 |
+--------+

-- Find names of all employees who have sold 
-- over 30000 to a single client
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
  SELECT works_with.emp_id
  FROM works_with
  WHERE works_with.total_sales >30000
);

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Michael    | Scott     |
| Stanley    | Hudson    |
+------------+-----------+

-- Find all clients who are handled by the branch
-- that Michael Scott manages
-- Assume you know Michael's ID
SELECT client.client_name
FROM client
WHERE client.branch_id IN (
  SELECT branch.branch_id
  FROM branch
  WHERE branch.mgr_id = 102
  LIMIT 1
);

+---------------------+
| client_name         |
+---------------------+
| Dunmore Highschool  |
| Lackawana Country   |
| Scranton Whitepages |
| FedEx               |
+---------------------+
