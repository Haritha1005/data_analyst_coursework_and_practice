-- 1. Create database and import data 

CREATE DATABASE employee;

-- Import CSV data into tables

Created a database named employee and imported data_science_team.csv, proj_table.csv, and emp_record_table.csv into the employee database in MySQL Workbench

-- 2. Create an ER diagram for the given employee database.

https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/ER%20Diagram_EmployeeDB.png
  
-- 3. Fetch employee details and department

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
FROM employee.emp_record_table;

-- 4. Fetch employee details based on rating

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record_table
WHERE EMP_RATING < 2;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record_table
WHERE EMP_RATING > 4;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM employee.emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;

-- 5. Concatenate first and last names in Finance department

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM employee.emp_record_table
WHERE DEPT = 'Finance';

-- 6. List employees who have someone reporting to them

SELECT *
FROM employee.emp_record_table
WHERE EMP_ID IN (SELECT DISTINCT MANAGER_ID FROM employee.emp_record_table);

-- 7. List employees from healthcare and finance departments using union

SELECT *
FROM employee.emp_record_table
WHERE DEPT = 'Healthcare'

UNION

SELECT *
FROM employee.emp_record_table
WHERE DEPT = 'Finance';

-- 8. List employee details and max rating by department

SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING, 
       MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS MAX_EMP_RATING
FROM employee.emp_record_table;

-- 9. Calculate minimum and maximum salary by role

SELECT ROLE, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY
FROM employee.emp_record_table
GROUP BY ROLE;

-- 10. Assign ranks based on experience

SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP,
       CASE
           WHEN EXP <= 2 THEN 'JUNIOR DATA SCIENTIST'
           WHEN EXP <= 5 THEN 'ASSOCIATE DATA SCIENTIST'
           WHEN EXP <= 10 THEN 'SENIOR DATA SCIENTIST'
           WHEN EXP <= 12 THEN 'LEAD DATA SCIENTIST'
           ELSE 'MANAGER'
       END AS RANK
FROM employee.emp_record_table;

-- 11. Create a view of employees with salary > 6000

CREATE VIEW high_salary_employees AS
SELECT *
FROM employee.emp_record_table
WHERE SALARY > 6000;

-- 12. Nested query to find employees with experience > 10 years

SELECT *
FROM employee.emp_record_table
WHERE EXP > (SELECT MAX(EXP) FROM employee.emp_record_table);

-- 13. Stored procedure to retrieve details of employees with exp > 3 years

DELIMITER //

CREATE PROCEDURE GetExperiencedEmployees()
BEGIN
    SELECT *
    FROM employee.emp_record_table
    WHERE EXP > 3;
END //

DELIMITER ;

-- 14. Stored function to check job profile against set standard

DELIMITER //

CREATE FUNCTION CheckJobProfile(EMP_ID INT)
RETURNS VARCHAR(50)
BEGIN
    DECLARE job_profile VARCHAR(50);
    
    SELECT ROLE INTO job_profile
    FROM employee.emp_record_table
    WHERE EMP_ID = id;
    
    CASE
        WHEN job_profile = 'JUNIOR DATA SCIENTIST' THEN
            RETURN 'Standard matched';
        WHEN job_profile = 'ASSOCIATE DATA SCIENTIST' THEN
            RETURN 'Standard matched';
        WHEN job_profile = 'SENIOR DATA SCIENTIST' THEN
            RETURN 'Standard matched';
        WHEN job_profile = 'LEAD DATA SCIENTIST' THEN
            RETURN 'Standard matched';
        WHEN job_profile = 'MANAGER' THEN
            RETURN 'Standard matched';
        ELSE
            RETURN 'Standard not matched';
    END CASE;
    
END //
  
-- 15. Create index on FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan. 

CREATE INDEX idx_first_name ON employee.emp_record_table(FIRST_NAME);
DROP INDEX idx_first_name ON employee.emp_record_table
SELECT * FROM employee.emp_record_table WHERE First_name = 'Eric';

-- 16. Calculate the Bonus for All Employees

SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    EMP_RATING,
    (0.05 * SALARY * EMP_RATING) AS BONUS
FROM 
    emp_record_table;

-- 17. Calculate the Average Salary Distribution Based on Continent and Country

SELECT 
    CONTINENT,
    COUNTRY,
    AVG(SALARY) AS AVERAGE_SALARY
FROM 
    emp_record_table
GROUP BY 
    CONTINENT, 
    COUNTRY;


