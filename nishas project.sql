-- CREATE THE DATABASE
CREATE DATABASE SALES;

-- SET THE DEFAULT DB
USE SALES;


-- CREATE A TABLE

CREATE TABLE SALES 
(
PURCHASE_NUMBER INT NOT NULL PRIMARY KEY,
 DATE_OF_PURCHASE DATE NOT NULL,
 CUSTOMER_ID INT,
 ITEM_CODE VARCHAR (20) NOT NULL
);

CREATE TABLE CUSTOMERS 
(
CUSTOMER_ID VARCHAR(255),
FIRST_NAME VARCHAR(255),
LAST_NAME VARCHAR(255),
EMAIL_ADDRESS VARCHAR (255),
NUMBER_OF_COMPLAIN INT
);

SELECT * FROM CUSTOMERS;
SELECT * FROM SALES.CUSTOMERS;

-- DROP THE TABLE

DROP TABLE CUSTOMERS;

-- ANOTHER WAY OF WRITING PRIMARY KEY
CREATE TABLE customers                                                              
(  
customer_id INT,  
first_name varchar(255),  
last_name varchar(255),  
email_address varchar(255),  
number_of_complaints int,  
primary key (customer_id)  
); 

CREATE TABLE ITEMS                                                              
(  
ITEM_CODE VARCHAR(255),  
ITEM varchar(255),  
UNIT_PRICE NUMERIC(10,2),  
COMPANY_ID varchar(255),  
number_of_complaints int,  
primary key (ITEM_CODE)  
); 

CREATE TABLE COMPANIES                                                              
(  
COMPANY_ID VARCHAR(255),  
COMPANY_NAME varchar(255),  
HEADQUARTERS_PHONE_NUMBER INT(12)   
); 

-- FOREIGN KEY

DROP TABLE SALES;

CREATE TABLE SALES 
(
PURCHASE_NUMBER INT,
 DATE_OF_PURCHASE DATE NOT NULL,
 CUSTOMER_ID INT,
 ITEM_CODE VARCHAR (20) NOT NULL,
 PRIMARY KEY (CUSTOMER_ID),
 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE
);

-- UNIQUE KEY

ALTER TABLE CUSTOMERS
ADD UNIQUE KEY (EMAIL_ADDRESS);

ALTER TABLE CUSTOMERS
DROP INDEX EMAIL_ADDRESS;


 ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

SELECT * FROM CUSTOMERS;
INSERT INTO customers (CUSTOMER_ID,first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('1','John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

-- SELECT STATEMENTS

SELECT DEPT_NO
FROM DEPARTMENTS;

SELECT * FROM DEPARTMENTS;
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME = 'Elvis';
-- AND OPERATOR

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME='KELLIE'AND GENDER ='F';

-- OR OPERATOR
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME='KELLIE'OR FIRST_NAME='ARUNA';

SELECT *
FROM EMPLOYEES
WHERE GENDER ='F' AND (FIRST_NAME='KELLIE' OR FIRST_NAME='ARUNA');

-- IN OPERATOR
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME IN ('DENIS', 'ELVIS');

-- NOT IN OPERATOR
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME NOT IN ('JOHN', 'MARK', 'JACOB');

-- LIKE OPERATOR
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE ('MARK%');

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE LIKE ('%2000%');

SELECT *
FROM EMPLOYEES
WHERE EMP_NO LIKE ('1000_');

-- WILDCARD CHARACTERS
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE ('J%ACK%');

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE ('J%ACK%');

-- BETWEEN OPERATOR
SELECT *
FROM SALARIES
WHERE SALARY BETWEEN '66000' AND '70000';

SELECT *
FROM SALARIES
WHERE EMP_NO NOT BETWEEN '10004' AND '10012';

SELECT *
FROM DEPARTMENTS
WHERE DEPT_NO BETWEEN 'D003' AND 'D006';

-- DISTINCT
SELECT DISTINCT HIRE_DATE
FROM EMPLOYEES;

-- COUNT
SELECT count(*)
FROM SALARIES
WHERE SALARY >= 100000;

SELECT COUNT(*)
FROM EMPLOYEES;
-- ORDER BY
SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- ALIAS AS
SELECT SALARY, COUNT(EMP_NO) AS EMPS_WITH_SAME_SALARYY
FROM SALARIES
WHERE SALARY>80000
group by SALARY
ORDER BY SALARY;

-- HAVING

SELECT EMP_NO, AVG(SALARY)
FROM SALARIES
group by EMP_NO
HAVING AVG(SALARY)>120000
ORDER BY EMP_NO;

-- WHERE VS HAVING
SELECT * FROM DEPT_EMP;

SELECT EMP_NO
FROM DEPT_EMP
WHERE from_date> '2000-01-01'
group by EMP_NO
HAVING COUNT(FROM_DATE)>1
ORDER BY EMP_NO;

-- LIMIT

SELECT * 
FROM DEPT_EMP
LIMIT 100;

-- insert
SELECT * FROM TITLES LIMIT 10;

INSERT INTO TITLES
VALUES
(999903,'SENIOR ENGINEER','1997-01-10','1998-01-10');

-- Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, 
-- and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.
-- Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.

INSERT INTO DEPT_EMP
(EMP_NO, DEPT_NO,FROM_DATE,TO_DATE)
VALUES
(999903,'d005','1997-10-01','9999-01-01');

select * from DEPT_EMP;

-- update Change the “Business Analysis” department name to “Data Analysis”.

select * from departments;

update departments
set
dept_name = 'Data Analysis'
where dept_no ='d009';

-- delete
-- Remove the department number 10 record from the “departments” table.

DELETE FROM DEPARTMENTS
WHERE DEPT_NO = 'd009';
rollback;

SELECT * FROM DEPARTMENTS;

-- count
-- How many departments are there in the “employees” database? Use the ‘dept_emp’ 
-- table to answer the question


-- SUM
-- What is the total amount of money spent on salaries for all contracts
--  starting after the 1st of January 1997?

SELECT SUM(SALARY)
FROM SALARIES
WHERE FROM_DATE > '1997-01-01';

-- MIN() AND MAX()

/* 1. Which is the lowest employee number in the database?

2. Which is the highest employee number in the database */

SELECT MIN(EMP_NO) FROM SALARIES;
SELECT MAX(EMP_NO) FROM SALARIES;

-- AVG()
-- What is the average annual salary
-- paid to employees who started after the 1st of January 1997?

SELECT AVG(SALARY)
FROM SALARIES
WHERE FROM_DATE>'1997-01-01';

-- round
-- Round the average amount of money spent on salaries for all contracts that
-- started after 
-- the 1st of January 1997 to a precision of cents.

SELECT ROUND(AVG(SALARY),2)
FROM SALARIES
WHERE FROM_DATE>'1997-01-01';

-- EXCERCISE

CREATE TABLE DEPARTMENTS_DUP
(
DEPT_NO CHAR(4),
DEPT_NAME VARCHAR(40)
);

INSERT INTO DEPARTMENTS_DUP
VALUES
('2','PUBLIC RELATIONS2');

DELETE FROM DEPARTMENTS_DUP
WHERE DEPT_NO='2';

INSERT INTO DEPARTMENTS_DUP
VALUES
('D010','PUBLIC RELATIONSNEW');
INSERT INTO DEPARTMENTS_DUP
VALUES
('D011','PUBLIC RELATIONSNEW3');

-- inner join
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

select e.emp_no, e.first_name, e.last_name, m.dept_no,e.hire_date
from dept_manager m
INNER JOIN employees e ON e.emp_no=m.emp_no;

-- 	LEFT JOIN
/* Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
See if the output contains a manager with that name.  

Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, 
‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'. */

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM EMPLOYEES e
LEFT JOIN dept_manager dm ON e.emp_no=dm.emp_no
WHERE e.last_name='Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;

SELECT * FROM DEPT_MANAGER;

/* old join sysntax
Extract a list containing information about all managers’ employee number, first and last name, department number, 
and hire date. Use the old type of join syntax to obtain the result.
*/

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM EMPLOYEES e, dept_manager dm
where e.emp_no=dm.emp_no;

-- cross join
/* Use a CROSS JOIN to return a list with all possible combinations between
 managers from the dept_manager table and department number 9. */
 
 SELECT dm.*, d.*
FROM dept_manager dm
cross JOIN departments d
where d.dept_no >'d009';

/* Return a list with the first 10 employees with all the departments they can be assigned to.

Hint: Don’t use LIMIT; use a WHERE clause. */

 SELECT e.*, d.*
FROM employees e
cross JOIN departments d
order by e.emp_no;


/*
Select all managers’ first and last name, hire date, job title, start date, and department name.
 */

SELECT E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE, D.DEPT_NAME, T.TITLES, DM.FROM_DATE
FROM EMPLOYEES E
JOIN
 DEPARTMENTS D ON DM.DEPT_NO=D.DEPT_no
JOIN 
DEPT_MANAGER DM ON E.EMP_NO=DM.EMP_NO
JOIN 
TITLES T ON E.EMP_NO=T.EMP_NO
WHERE T.TITLES='MANAGER'
ORDER BY E.EMP_NO;

SELECT e.first_name,e.last_name,e.hire_date,t.title,m.from_date,d.dept_name
FROM
employees e
JOIN
dept_manager m ON e.emp_no = m.emp_no
JOIN
departments d ON m.dept_no = d.dept_no
JOIN
titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

/*How many male and how many female managers do we have in the ‘employees’ database?*/


select
e.gender, count(e.emp_no)
from employees e
join dept_manager m ON m.emp_no=e.emp_no
group by gender;

-- subquery
/* Extract the information about all department managers who were hired between the
 1st of January 1990 and the 1st of January 1995.
*/

SELECT *
FROM
dept_manager
WHERE
emp_no IN (SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');


/* Select the entire information for all employees whose job title is “Assistant Engineer”. 

Hint: To solve this exercise, use the 'employees' table.*/

select *
from employees e
where
exists( select *
from titles t
where t.emp_no=e.emp_no
AND title = 'Assistant Engineer');

/* subqueries 
Starting your code with “DROP TABLE”,
 create a table called “emp_manager” (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
 */
 
 CREATE TABLE EMP_MANAGER (
    EMP_NO INT NOT NULL,
    DEPT_NO CHAR(4) NULL,
    MANAGER_NO INT(11) NOT NULL
);
 
 SELECT * FROM EMP_MANAGER;
 
 /*Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
Your query skeleton must be:
Insert INTO emp_manager SELECT
U.*
FROM
                 (A)
UNION (B) UNION (C) UNION (D) AS U;
A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). 
In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020
 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.
Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.
Your output must contain 42 rows.
*/
 
 INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    -- self join
    /*
select e2.*
from emp_manager e1
join emp_manager e2 on e1.emp_no=e2.emp_no
where e2.emp_no in (select manager_no from emp_manager);
    */
    
    -- view
    /*
    Create a view that will extract the average salary of all managers registered 
    in the database. Round this value to the nearest cent.

If you have worked correctly, after executing the view from the “Schemas” section
 in Workbench, you should obtain the value of 66924.27. */
 
  CREATE VIEW AVERAGE_SALARY_manager AS
 SELECT ROUND(AVG(SALARY),2)
 FROM salaries s
 JOIN
dept_manager m ON s.emp_no = m.emp_no;

-- window functions
/*
Write a query that upon execution, assigns a row number to all managers we have information for 
in the "employees" database (regardless of their department).
Let the numbering disregard the department the managers have worked in. Also, let it start from 
the value of 1. Assign that value to the manager with the lowest employee number.
*/

select emp_no, dept_no,
row_number() over (order by emp_no) AS manager_row_number
from dept_manager;
 
 /*
Write a query that upon execution, assigns a sequential number for each employee number registered
 in the "employees" table. Partition the data by the employee's first name and order it by their 
 last name in ascending order (for each partition).
 */
 select emp_no, birth_date,first_name,last_name,
row_number() over (partition by first_name order by last_name asc) AS employee_seq
from employees;
 
 /*
 Obtain a result set containing the salary values each manager has signed a contract for.
 To obtain the data, refer to the "employees" database.

Use window functions to add the following two columns to the final output:

- a column containing the row number of each row from the obtained dataset, starting from 1.
- a column containing the sequential row numbers associated to the rows for each manager, where their highest salary
 has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
Finally, while presenting the output, make sure that the data has been ordered by the values in the first of
 the row number columns, and then by the salary values for each partition in ascending order.
*/

select SALARY, dm.emp_no,
row_number() over () AS row_num1,
row_number() over (PARTITION BY emp_no ORDER BY salary ASC) AS row_num2
from dept_manager dm
    JOIN 
salaries s ON dm.emp_no = s.emp_no
ORDER BY row_num1, emp_no, salary ASC;

-- GROUP BY VS WHERE
/*
Find out the lowest salary value each employee has ever signed a contract for.
 To obtain the desired output, use a subquery containing a window function, 
 as well as a window specification introduced with the help of the WINDOW keyword.

Also, to obtain the desired result set, refer only to data from the “salaries” table.
*/
SELECT
A.EMP_NO,
MIN(SALARY) AS MIN_SALARY FROM (
SELECT
EMP_NO, SALARY,
ROW_NUMBER() OVER W AS ROW_NUM
FROM SALARIES
WINDOW W AS (PARTITION BY EMP_NO ORDER BY SALARY)) A
GROUP BY EMP_NO;

-- rank() and dense_rank()
/*
Write a query containing a window function to obtain all salary values that
 employee number 10560 has ever signed a contract for.
Order and display the obtained salary values from highest to lowest.
*/


SELECT
EMP_NO, SALARY,
ROW_NUMBER() OVER W AS RANK_NUM
FROM SALARIES
WHERE EMP_NO='10560'
WINDOW W AS (PARTITION BY EMP_NO ORDER BY SALARY DESC) ;

/*
Write a query that upon execution, displays the number of salary 
contracts that each manager has ever signed while working in the company.
*/


SELECT
M.EMP_NO, (COUNT(SALARY)) AS NO_OF_SALARY_CONTRACTS
FROM DEPT_MANAGER M
JOIN
SALARIES S ON M.EMP_NO=S.EMP_NO
GROUP BY emp_no
ORDER BY emp_no;

/*
Write a query that upon execution retrieves a result set containing all salary values that employee 10560
 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest 
 in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent
 rows are allowed.
*/

SELECT
EMP_NO, SALARY,
RANK() OVER W AS RANK_NUM
FROM SALARIES
WHERE EMP_NO='10560'
WINDOW W AS (PARTITION BY EMP_NO ORDER BY SALARY DESC);

/*
Write a query that ranks the salary values in descending order of all contracts signed 
by employees numbered between 10500 and 10600 inclusive. Let equal salary values for 
one and the same employee bear the same rank. Also, allow gaps in the ranks obtained
 for their subsequent rows.Use a join on the “employees” and “salaries” tables to obtain 
 the desired result.
*/

SELECT
E.EMP_NO,
RANK() OVER W AS SALARY_RANK,
S.SALARY
FROM EMPLOYEES E
JOIN
SALARIES S ON S.EMP_NO=E.EMP_NO
WHERE E.EMP_NO BETWEEN 10500 AND 10600
WINDOW W AS (PARTITION BY E.EMP_NO ORDER BY S.SALARY DESC);

/*
LAG() & LEAD()
Write a query that can extract the following information from the "employees" database:
- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600 inclusive
- a column showing the previous salary from the given ordered list
- a column showing the subsequent salary from the given ordered list
- a column displaying the difference between the current salary of a certain employee and their previous salary
- a column displaying the difference between the next salary of a certain employee and their current salary
Limit the output to salary values higher than $80,000 only.
Also, to obtain a meaningful result, partition the data by employee number.
*/

SELECT EMP_NO,SALARY,
LAG(SALARY) OVER W AS PREVIOUS_SALARY,
LEAD(SALARY) OVER W AS NEXT_SALARY,
SALARY - LAG(salary) OVER w AS diff_salary_current_previous,
LEAD(salary) OVER w - SALARY AS diff_salary_current_previous
FROM SALARIES
WHERE SALARY> 80000 AND EMP_NO BETWEEN 10500 AND 10600
WINDOW W AS (PARTITION BY emp_no ORDER BY salary);

/*
The MySQL LAG() and LEAD() value window functions can have a second argument, designating how
 many rows/steps back (for LAG()) or forth (for LEAD()) we'd like to refer to with respect to a given record.
With that in mind, create a query whose result set contains data arranged by the salary values
 associated to each employee number (in ascending order). Let the output contain the following six columns:
- the employee number
- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)
- the employee's previous salary
- the employee's contract salary value preceding their previous salary
- the employee's next salary
- the employee's contract salary value subsequent to their next salary
Restrict the output to the first 1000 records you can obtain.
*/

SELECT EMP_NO,SALARY,
LAG(SALARY) OVER W AS PREVIOUS_SALARY,
LAG(salary, 2) OVER w AS 1_before_previous_salary,
LEAD(SALARY) OVER W AS NEXT_SALARY,
LEAD(salary, 2) OVER w AS 1_AFTER_NEXT_salary
FROM SALARIES
WINDOW W AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;

/*
Create a query that upon execution returns a result set containing the employee numbers, 
contract salary values, start, and end dates of the first ever contracts that each employee
 signed for the company.
To obtain the desired output, refer to the data stored in the "salaries" table.
*/

SELECT S.EMP_NO, S.SALARY,S.FROM_DATE,S.TO_DATE
FROM SALARIES S
JOIN
(SELECT
emp_no, MIN(from_date) AS from_date
FROM
salaries
GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
s.from_date = s1.from_date;





 
    
 
 
 




  














