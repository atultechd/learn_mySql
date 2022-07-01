
-- On delete

-- Deleting "emp_id" (102) from "employee" table
DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM branch;

+-----------+-------------+--------+----------------+
| branch_id | branch_name | mgr_id | mgr_start_date |
+-----------+-------------+--------+----------------+
|         1 | Corporate   |    100 | 2006-02-09     |
|         2 | Scranton    |   NULL | 1992-04-06     |
|         3 | Stamford    |    106 | 1998-02-13     |
|         4 | Atul        |   NULL | NULL           |
+-----------+-------------+--------+----------------+

-- We can clearly see here, emp_id 102(whole row) is not present in the table.
SELECT * FROM employee;

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |     NULL |         2 |
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |     NULL |         2 |
|    105 | Stanley    | Hudson    | 1958-02-19 | M    |  69000 |     NULL |         2 |
|    106 | Josh       | Porter    | 1969-09-05 | M    |  78000 |      100 |         3 |
|    107 | Andy       | Bernard   | 1973-07-22 | M    |  65000 |      106 |         3 |
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
+--------+------------+-----------+------------+------+--------+----------+-----------+

-- We are exploring "on delete cascade" here.
DELETE FROM branch
WHERE branch_id = 2;

-- Observe, branch_id 2 is not present here.
SELECT * FROM branch_supplier;

+-----------+-----------------+------------------+
| branch_id | supplier_name   | supply_type      |
+-----------+-----------------+------------------+
|         3 | Hammer Mill     | Paper            |
|         3 | Patriot Paper   | Paper            |
|         3 | Stamford Lables | Custom Forms     |
|         3 | Uni-ball        | Writing Utensils |
+-----------+-----------------+------------------+
