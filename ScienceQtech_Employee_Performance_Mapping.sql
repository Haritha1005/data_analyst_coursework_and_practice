### 1. Create database and import data 

CREATE DATABASE employee;

### Import CSV data into tables

Created a database named employee and imported data_science_team.csv, proj_table.csv, and emp_record_table.csv into the employee database in MySQL Workbench

### 2. Create an ER diagram for the given employee database.

![ER Diagram]("C:\Data Analytics - Master course Simplilearn\Course 2 - SQL\ER Diagram_EmployeeDB.png")

### 3. Fetch employee details and department

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
FROM employee.emp_record_table;

### 4. Fetch employee details based on rating

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record_table
WHERE EMP_RATING < 2;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record_table
WHERE EMP_RATING > 4;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;
