

-- Second module is of inserting fields into the table........

INSERT INTO student VALUES(1, 'Atul', 'Maths');
INSERT INTO student VALUES(2, 'Narender', 'Biology');
INSERT INTO student VALUES(3, 'Suraj', 'Computer');
INSERT INTO student VALUES(4, 'Anuvart', 'English');

-- Just specify which field you want to fill, incase you don't know every field
-- In this case we don't know Pulkit's major , so we specifically metioning 
-- the fileds that we know 

INSERT INTO student(student_id, name) VALUES(5, 'Pulkit');

-- select and gives us all information from the table

SELECT * FROM student;


-- We are getting this result after fetching all information

+------------+----------+----------+
| student_id | name     | major    |
+------------+----------+----------+
|          1 | Atul     | Maths    |
|          2 | Narender | Biology  |
|          3 | Suraj    | Computer |
|          4 | Anuvart  | English  |
|          5 | Pulkit   | NULL     |
+------------+----------+----------+