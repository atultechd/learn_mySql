
-- module_4 is about update and delete in a table.............

-- We have this table(student2) and we have to perform our operation in this table

+------------+--------+--------------+
| student_id | name   | major        |
+------------+--------+--------------+
|          1 | Atul   | Computer.Sci |
|          2 | Pranav | Biology      |
|          3 | Prerna | ui/ux        |
+------------+--------+--------------+

-- update query to change major form 'Biology' to 'Bio'

UPDATE student2
SET major = 'Bio'
WHERE major = 'Biology';

SELECT * FROM student2;

-- We get this result after updation

+------------+--------+--------------+
| student_id | name   | major        |
+------------+--------+--------------+
|          1 | Atul   | Computer.Sci |
|          2 | Pranav | Bio          |
|          3 | Prerna | ui/ux        |
+------------+--------+--------------+

-- Another way to write updation query but here we are giving information about id.

UPDATE student2
SET major = 'comp sci'
WHERE student_id = 1;

SELECT * FROM student2;

+------------+--------+----------+
| student_id | name   | major    |
+------------+--------+----------+
|          1 | Atul   | comp sci |
|          2 | Pranav | Bio      |
|          3 | Prerna | ui/ux    |
+------------+--------+----------+

-- Applying 'OR' condition

UPDATE student2
SET major = 'IT'
WHERE major = 'comp sci' OR major = 'ui/ux';

SELECT * FROM student2;

+------------+--------+-------+
| student_id | name   | major |
+------------+--------+-------+
|          1 | Atul   | IT    |
|          2 | Pranav | Bio   |
|          3 | Prerna | IT    |
+------------+--------+-------+

UPDATE student2
SET name = 'Rishu', major = 'CSE'
WHERE student_id = 2;

SELECT * FROM student2;

+------------+--------+-------+
| student_id | name   | major |
+------------+--------+-------+
|          1 | Atul   | IT    |
|          2 | Rishu  | CSE   |
|          3 | Prerna | IT    |
+------------+--------+-------+

-- We can use this also but without this 'WHERE' query it will apply to all IDs

UPDATE student2
SET name = 'Rishu', major = 'CSE';

-- ................................................................................

-- Now DELETE query

DELETE FROM student2
WHERE student_id = 3;

SELECT * FROM student2;

+------------+-------+-------+
| student_id | name  | major |
+------------+-------+-------+
|          1 | Atul  | IT    |
|          2 | Rishu | CSE   |
+------------+-------+-------+

-- Delete everyting from student

DELETE FROM student2

-- now we have the table but all item are deleted.