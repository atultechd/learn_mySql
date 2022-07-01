
-- Basic queries.................................................

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          1 | Atul     | Maths    |
|          2 | Narender | Biology  |
|          3 | Suraj    | Computer |
|          4 | Anuvart  | English  |
|          5 | Pulkit   | Accounts |
+------------+----------+----------+

-- we are selecting 'name' column instead of '*'

SELECT name FROM student;

+----------+
| name     |
+----------+
| Atul     |
| Narender |
| Suraj    |
| Anuvart  |
| Pulkit   |
+----------+

-- This query is fetching columns by name and major

SELECT student.name, student.major FROM student;

+----------+----------+
| name     | major    |
+----------+----------+
| Atul     | Maths    |
| Narender | Biology  |
| Suraj    | Computer |
| Anuvart  | English  |
| Pulkit   | Accounts |
+----------+----------+

-- Now in this query 'ORDER BY' means alphabatical order 'name'

SELECT student.name, student.major
FROM student
ORDER BY name;

+----------+----------+
| name     | major    |
+----------+----------+
| Anuvart  | English  |
| Atul     | Maths    |
| Narender | Biology  |
| Pulkit   | Accounts |
| Suraj    | Computer |
+----------+----------+

-- same but descending order
SELECT student.name, student.major
FROM student
ORDER BY name DESC;

+----------+----------+
| name     | major    |
+----------+----------+
| Suraj    | Computer |
| Pulkit   | Accounts |
| Narender | Biology  |
| Atul     | Maths    |
| Anuvart  | English  |
+----------+----------+

-- Now order by 'student_id' descending order
SELECT student.name, student.major
FROM student
ORDER BY student_id DESC;

+----------+----------+
| name     | major    |
+----------+----------+
| Pulkit   | Accounts |
| Anuvart  | English  |
| Suraj    | Computer |
| Narender | Biology  |
| Atul     | Maths    |
+----------+----------+

-- order by 'student_id' but ascending order
SELECT student.name, student.major
FROM student
ORDER BY student_id ASC;

+----------+----------+
| name     | major    |
+----------+----------+
| Atul     | Maths    |
| Narender | Biology  |
| Suraj    | Computer |
| Anuvart  | English  |
| Pulkit   | Accounts |
+----------+----------+

-- if we have table like this (with 2 different person with similar major)
+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          1 | Atul     | Bio      |
|          2 | Narender | Bio      |
|          3 | Suraj    | Computer |
|          4 | Anuvart  | English  |
|          5 | Pulkit   | Accounts |
+------------+----------+----------+

-- This query fetch all information but major would be first priority
-- first 'major' will come in order and then 
-- 'student_id' will come in order(here ascending)

SELECT *
FROM student
ORDER BY major, student_id ASC;

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          5 | Pulkit   | Accounts |
|          1 | Atul     | Bio      |
|          2 | Narender | Bio      |
|          3 | Suraj    | Computer |
|          4 | Anuvart  | English  |
+------------+----------+----------+

-- This query fetch all information but major would be first priority
-- first 'major' will come in order and then 
-- 'student_id' will come in order(here descending)

SELECT *
FROM student
ORDER BY major, student_id DESC;

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          5 | Pulkit   | Accounts |
|          2 | Narender | Bio      |
|          1 | Atul     | Bio      |
|          3 | Suraj    | Computer |
|          4 | Anuvart  | English  |
+------------+----------+----------+

-- This query fetch all information but only 3(because of 'LIMIT')

SELECT *
FROM student
LIMIT 3;

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          1 | Atul     | Bio      |
|          2 | Narender | Bio      |
|          3 | Suraj    | Computer |
+------------+----------+----------+

-- here both commands are working (first -> order by and then -> limit)

SELECT *
FROM student
ORDER BY student_id DESC
LIMIT 3;

+------------+---------+----------+
| student_id | name    | major    |
+------------+---------+----------+
|          5 | Pulkit  | Accounts |
|          4 | Anuvart | English  |
|          3 | Suraj   | Computer |
+------------+---------+----------+

SELECT *
FROM student
WHERE major = 'Bio';

+------------+----------+-------+
| student_id | name     | major |
+------------+----------+-------+
|          1 | Atul     | Bio   |
|          2 | Narender | Bio   |
+------------+----------+-------+


-- we are using smaller than sign
-- here when 'student_id' smaller than 4

SELECT *
FROM student
WHERE student_id < 4;

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          1 | Atul     | Bio      |
|          2 | Narender | Bio      |
|          3 | Suraj    | Computer |
+------------+----------+----------+

-- using smaller than sign '<'
-- and only those who are not named as 'Atul'('<>' means 'is not')

SELECT *
FROM student
WHERE student_id < 4 AND name <> 'Atul';

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          2 | Narender | Bio      |
|          3 | Suraj    | Computer |
+------------+----------+----------+

-- only people in parameters will be fetched

SELECT *
FROM student
WHERE name IN('Atul', 'Pulkit', 'Suraj');

+------------+--------+----------+
| student_id | name   | major    |
+------------+--------+----------+
|          1 | Atul   | Bio      |
|          3 | Suraj  | Computer |
|          5 | Pulkit | Accounts |
+------------+--------+----------+


SELECT *
FROM student
WHERE major IN('Bio', 'Accounts') AND student_id < 4;

+------------+----------+-------+
| student_id | name     | major |
+------------+----------+-------+
|          1 | Atul     | Bio   |
|          2 | Narender | Bio   |
+------------+----------+-------+
