
-- module_3 is about constraints.............

-- Here we again creating a table but with some constraints that are:
-- i) name should not be null
-- ii) major should always be unique

CREATE TABLE student(
  student_id INT,
  name VARCHAR(10) NOT NULL,
  major VARCHAR(15) UNIQUE,
  PRIMARY KEY(student_id)
);

-- if we try to put name as 'null' or repeat the major for different ID's,
-- so we will expecting error 
-- Let's see this with example

INSERT INTO student VALUES(1, "Anuvart", 'English');

INSERT INTO student VALUES(3, "Abhishek", 'Biology');

-- we can see error here after filling name field as null
INSERT INTO student VALUES(3, NULL, 'Chemistry');
ERROR 1048 (23000): Column 'name' cannot be null

-- we can see error here after filling major field more than once
INSERT INTO student VALUES(3, "Himanshu", 'Biology');
ERROR 1062 (23000): Duplicate entry 'Biology' for key 'student.major'

-- for deleting table we use drop table
DROP TABLE student;

-- ......................................................................

-- In the new table we are changing something which is 
-- Here we don't know the major of any student so we set it as default

CREATE TABLE student1(
  student_id INT,
  name VARCHAR(10) NOT NULL,
  major VARCHAR(15) DEFAULT 'undecided',
  PRIMARY KEY(student_id)
);

INSERT INTO student1(student_id, name) VALUES(1, 'Pulkit');

SELECT * FROM student1;
+------------+--------+-----------+
| student_id | name   | major     |
+------------+--------+-----------+
|          1 | Pulkit | undecided |
+------------+--------+-----------+

DROP TABLE student1;

-- ..............................................................

-- In this new table student2 we are automate the student_id field as auto_increment
-- As we don't have to give id again and again

CREATE TABLE student2(
  student_id INT AUTO_INCREMENT,
  name VARCHAR(10) NOT NULL,
  major VARCHAR(15) DEFAULT 'undecided',
  PRIMARY KEY(student_id)
);

INSERT INTO student2(name, major) VALUE('Atul', 'Computer.Sci');
INSERT INTO student2(name, major) VALUE('Pranav', 'Biology');
INSERT INTO student2(name, major) VALUE('Prerna', 'ui/ux');

SELECT * FROM student2;

-- we get id auto incremented............................

+------------+--------+--------------+
| student_id | name   | major        |
+------------+--------+--------------+
|          1 | Atul   | Computer.Sci |
|          2 | Pranav | Biology      |
|          3 | Prerna | ui/ux        |
+------------+--------+--------------+
