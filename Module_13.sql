
-- Triggers

-- Create "trigger_test" table
CREATE TABLE trigger_test (
  message VARCHAR(100)
);


-- Here we are saying that our "delimiter" is "$$" for now (but ";" is by default)
DELIMITER $$

-- Creating trigger before inserting value in table "employee"
CREATE
  TRIGGER my_trigger BEFORE INSERT
  ON employee
  FOR EACH ROW BEGIN
    INSERT INTO trigger_test VALUES('added new employee');
  END$$

-- Again we set delimiter as ";"(original)
DELIMITER ;

INSERT INTO employee
VALUES(109,'Oscar', 'Martinez', '1968-02-19', 'M', 90000, 106, 3);

SELECT * FROM trigger_test;

SELECT * FROM employee;

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |     NULL |      NULL |
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |     NULL |      NULL |
|    105 | Stanley    | Hudson    | 1958-02-19 | M    |  69000 |     NULL |      NULL |
|    106 | Josh       | Porter    | 1969-09-05 | M    |  78000 |      100 |         3 |
|    107 | Andy       | Bernard   | 1973-07-22 | M    |  65000 |      106 |         3 |
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
|    109 | Oscar      | Martinez  | 1968-02-19 | M    |  90000 |      106 |         3 |
+--------+------------+-----------+------------+------+--------+----------+-----------+


-- .........................................................
DELIMITER $$

CREATE
  TRIGGER my_trigger2 BEFORE INSERT
  ON employee
  FOR EACH ROW BEGIN
    INSERT INTO trigger_test VALUES(NEW.first_name);
  END$$

DELIMITER ;

INSERT INTO employee
VALUES(110,'Kevin', 'Malhotra', '1978-02-27', 'M', 78000, 106, 3);

SELECT * FROM trigger_test;

SELECT * FROM employee;

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |     NULL |      NULL |
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |     NULL |      NULL |
|    105 | Stanley    | Hudson    | 1958-02-19 | M    |  69000 |     NULL |      NULL |
|    106 | Josh       | Porter    | 1969-09-05 | M    |  78000 |      100 |         3 |
|    107 | Andy       | Bernard   | 1973-07-22 | M    |  65000 |      106 |         3 |
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
|    109 | Oscar      | Martinez  | 1968-02-19 | M    |  90000 |      106 |         3 |
|    110 | Kevin      | Malhotra  | 1978-02-27 | M    |  78000 |      106 |         3 |
+--------+------------+-----------+------------+------+--------+----------+-----------+



DELIMITER $$

CREATE
  TRIGGER my_trigger3 BEFORE INSERT
  ON employee
  FOR EACH ROW BEGIN
    IF NEW.sex = 'M' THEN
      INSERT INTO trigger_test VALUES('Added male employee');
    ELSEIF NEW.sex = 'F' THEN
      INSERT INTO trigger_test VALUES('Added female employee');
    ELSE
      INSERT INTO trigger_test VALUES('Added other employee');
    END IF;
  END$$

DELIMITER ;

INSERT INTO employee
VALUES(111,'Judith', 'Walker', '1998-12-04', 'F', 72500, 105, 3);

SELECT * FROM trigger_test;

SELECT * FROM employee;

+--------+------------+-----------+------------+------+--------+----------+-----------+
| emp_id | first_name | last_name | birth_day  | sex  | salary | super_id | branch_id |
+--------+------------+-----------+------------+------+--------+----------+-----------+
|    100 | David      | Wallace   | 1967-11-17 | M    | 250000 |     NULL |         1 |
|    101 | Jan        | Levinson  | 1961-05-11 | F    | 110000 |      100 |         1 |
|    103 | Angela     | Martin    | 1971-06-25 | F    |  63000 |     NULL |      NULL |
|    104 | Kelly      | Kapoor    | 1980-02-05 | F    |  55000 |     NULL |      NULL |
|    105 | Stanley    | Hudson    | 1958-02-19 | M    |  69000 |     NULL |      NULL |
|    106 | Josh       | Porter    | 1969-09-05 | M    |  78000 |      100 |         3 |
|    107 | Andy       | Bernard   | 1973-07-22 | M    |  65000 |      106 |         3 |
|    108 | Jim        | Halpert   | 1978-10-01 | M    |  71000 |      106 |         3 |
|    109 | Oscar      | Martinez  | 1968-02-19 | M    |  90000 |      106 |         3 |
|    110 | Kevin      | Malhotra  | 1978-02-27 | M    |  78000 |      106 |         3 |
|    111 | Judith     | Walker    | 1998-12-04 | F    |  72500 |      105 |         3 |
+--------+------------+-----------+------------+------+--------+----------+-----------+



-- We are now dropping our table, so it'll be no longer in use

DROP TABLE trigger_test;