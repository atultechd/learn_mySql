
-- first module is of create table...................

CREATE TABLE student(
  student_id INT,
  name VARCHAR(10),
  major VARCHAR(15),
  PRIMARY KEY(student_id)
);

-- .....OR .....

CREATE TABLE student(
  student_id INT PRIMARY KEY, 
  name VARCHAR(10),
  major VARCHAR(15),
);

-- .....................................

DESC student;

| | | | | |
v v v v v v


+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | NO   | PRI | NULL    |       |
| name       | varchar(10) | YES  |     | NULL    |       |
| major      | varchar(15) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

-- for deleting table we use drop table
DROP TABLE student;