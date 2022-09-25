/* Practice with HR */

SELECT * FROM TAB;

SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM emp_details_view;
SELECT * FROM jobs;
SELECT * FROM job_history;
SELECT * FROM locations;
SELECT * FROM regions;

SELECT DISTINCT department_name
FROM departments;

SELECT department_name, country_id
FROM departments, locations
WHERE departments.location_id = locations.location_id;

SELECT *
FROM employees;

SELECT employee_id AS "Employee ID", phone_number "Phone Number"   
FROM employees
ORDER BY phone_number ASC, employee_id ASC;

/* int / int returns float */
SELECT (7/24) FROM dual;

SELECT employee_id || ' : '|| department_name AS "ID : Department"
FROM employees A, departments B
WHERE A.department_id = B.department_id;

SELECT LTRIM('ABCDE', 'AB'), RTRIM('ABCDE','E')
FROM dual;

/* Diamonds in ERD are indexes, 
Key-with-arrow shapes are foreign keys names,
Key shapes are primary keys or pf keys names,
Asterisks are values having Not Null,
P for primary key
U for unique key(Null Possible)
F for foreign key referencing other table's unique key(Null Possible)
*/

SELECT * FROM TAB;
SELECT * FROM departments;

SELECT first_name, last_name, EMP.department_id
FROM employees EMP
WHERE NOT EXISTS 
(
    SELECT department_id
    FROM departments DEP
    WHERE DEP.department_id = EMP.department_id
);

SELECT employee_id, first_name, last_name
FROM employees
WHERE MOD(employee_id,2) = 0;

SELECT ALL employee_id, first_name, last_name
FROM employees
WHERE MOD(employee_id,2) = 0;

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE employee_id = ANY
    (
    SELECT employee_id
    FROM employees
    WHERE MOD(employee_id,2) = 0
    );

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id = 90;

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id = ANY(20, 90);

SELECT LOC.city, MAX(EMP.salary) LOCMAX
FROM employees EMP, departments DEP, locations LOC
WHERE EMP.department_id = DEP.department_id 
AND DEP.location_id = LOC.location_id
GROUP BY LOC.city;

SELECT LOC.location_id, MAX(EMP.salary) LOCMAX
FROM employees EMP, departments DEP, locations LOC
WHERE EMP.department_id = DEP.department_id 
AND DEP.location_id = LOC.location_id
GROUP BY LOC.location_id;

/* The max salary employees IDs and their salaries
from the max salaries grouped by cities are */
SELECT EMP.employee_id, LOC.city, EMP.salary
FROM employees EMP, departments DEP, locations LOC,
(
    SELECT LOC.location_id, MAX(EMP.salary) LOCMAX
    FROM employees EMP, departments DEP, locations LOC
    WHERE EMP.department_id = DEP.department_id 
    AND DEP.location_id = LOC.location_id
    GROUP BY LOC.location_id
) LOCMAXT
WHERE EMP.department_id = DEP.department_id
AND DEP.location_id = LOC.location_id
AND EMP.salary = LOCMAXT.LOCMAX
AND LOC.location_id = LOCMAXT.location_id
ORDER BY EMP.salary DESC;



/* SQL Exercises
https://www.w3schools.com/sql/sql_exercises.asp
https://www.w3resource.com/sql-exercises/
https://www.hackerrank.com/domains/sql
https://www.sql-ex.ru/
https://www.wiseowl.co.uk/sql/exercises/standard/
*/


