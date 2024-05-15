-- 1. Create database and import data
CREATE DATABASE employee;

-- Import CSV data into tables
LOAD DATA INFILE 'data_science_team.csv' INTO TABLE employee.data_science_team
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'proj_table.csv' INTO TABLE employee.proj_table
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'emp_record_table.csv' INTO TABLE employee.emp_record_table
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
