-- JOINS

-- Create the 'departments' table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create the 'employees' table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert values into the 'departments' table
INSERT INTO departments (dept_id, dept_name) VALUES
(1001, 'HR'),
(1002, 'IT'),
(1003, 'Marketing'),
(1004, 'Sales');

-- Insert values into the 'employees' table
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Shubham', 1001),
(2, 'Sourabh', 1002),
(3, 'Anant', 1003),
(4, 'Deepti', 1001);

-- INNER JOIN
#Rturns only the rows where there is a match in both tables

SELECT employees.emp_name,departments.dept_name
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;


-- 2. LEFT JOIN

/*Returns all rows from the left table and matched rows from the right table.
 If no match, NULL values are returned for columns from the right table.*/

SELECT employees.emp_name,departments.dept_name
FROM employees
LEFT JOIN departments on employees.dept_id = departments.dept_id;


-- 3. RIGHT JOIN

/*Returns all rows from the right table and matched rows from the left table. 
If no match, NULL values are returned for columns from the left table.*/

SELECT employees.emp_name,departments.dept_name
FROM employees
RIGHT JOIN departments on employees.dept_id = departments.dept_id;

-- 4.full outer JOIN

/*Returns all rows when there is a match in one of the tables.
If there is no match,
the result is NULL from the side of the table that does not have a match.*/

/*Note: MySQL does not support FULL OUTER JOIN directly. 
However, you can achieve this by combining LEFT JOIN and RIGHT JOIN with a UNION.*/

SELECT employees.emp_name,departments.dept_name
from employees
left join departments on employees.dept_id = departments.dept_id
UNION
select employees.emp_name,departments.dept_name
from employees
right join departments on employees.dept_id = departments.dept_id;

-- 5.SELF JOIN

#A self-join is a regular join but the table is joined with itself.
#Scenario:
#Let's assume we want to find employees who work in the same department. 

SELECT e1.emp_name AS Employee1, e2.emp_name AS Employee2, e1.dept_id
FROM employees e1
JOIN employees e2 ON e1.dept_id = e2.dept_id AND e1.emp_id != e2.emp_id;



#Additional Scenarios and Advanced JOIN Concepts
#1.Using JOINS with Multiple Tables
#2.Joining Tables with NULL Values
#3.Self-JOIN to Find Hierarchical Data
#4.Combining JOINs with Aggregation


# Scenario 1: Using JOINS with Multiple Tables
-- Let's add an projects table to demonstrate joining multiple tables.

-- Create the 'projects' table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert values into the 'projects' table
INSERT INTO projects (project_id, project_name, dept_id) VALUES
(201, 'Project A', 1001),
(202, 'Project B', 1002),
(203, 'Project C', 1003);

SELECT employees.emp_name,departments.dept_name,projects.project_name
from employees
INNER JOIN departments on employees.dept_id = departments.dept_id
INNER JOIN projects ON departments.dept_id = projects.dept_id;

#Scenario 2: joining the tables with NULL values
#Example:
-- modify the employees table to include a row with a NULL department.

INSERT INTO employees (emp_id, emp_name, dept_id) 
VALUES(5, 'Eve', NULL);


#Left JOIN 
SELECT employees.emp_name,departments.dept_name
FROM employees
LEFT JOIN departments on employees.dept_id = departments.dept_id;

#Scenario 3: Self-JOIN to Find Hierarchical Data
#Example:
#Find employees who are mentors to other employees.
# This example holds good even for manager and employee Question where in you try to find which 
#manager is the manger for which employee.

-- Table: mentorship

CREATE TABLE mentorship (
    mentor_id INT,
    mentee_id INT,
    FOREIGN KEY (mentor_id) REFERENCES employees(emp_id),
    FOREIGN KEY (mentee_id) REFERENCES employees(emp_id)
);

-- Insert values into the 'mentorship' table
INSERT INTO mentorship (mentor_id, mentee_id) VALUES
(1, 2),
(1, 3),
(2, 4);

SELECT e1.emp_name AS Mentor ,e2.emp_name AS Mentee
FROM mentorship
JOIN employees e1 ON mentorship.mentee_id=e1.emp_id
JOIN employees e2 ON mentorship.mentee_id=e2.emp_id;


/*Scenario 4: Combining JOINs with Aggregation
Example:
Calculate the number of employees in each department*/

#Aggregation Query:

SELECT departments.dept_name,count(employees.emp_id) as num_employees
FROM departments
LEFT JOIN employees ON departments.dept_id = employees.dept_id
GROUP BY departments.dept_name;

# SCENARIO 5;
-- Suppose we have a salary range table and 
#we want to find which salary range each employee falls into.


-- Create the 'salary_range' table
CREATE TABLE salary_range (
    range_id INT PRIMARY KEY,
    min_salary INT,
    max_salary INT,
    range_name VARCHAR(50)
);

-- Insert values into the 'salary_range' table
INSERT INTO salary_range (range_id, min_salary, max_salary, range_name) VALUES
(1, 0, 3000, 'Low'),
(2, 3001, 6000, 'Medium'),
(3, 6001, 9000, 'High');

ALTER TABLE employees ADD COLUMN salary INT;
UPDATE employees set salary = 2500 where emp_id = 1;
Update employees set salary = 4000 where emp_id = 2;
Update employees set salary = 3500 where emp_id = 3;
UPDATE employees set salary = 8000 where emp_id = 4;
UPdATE employees set salary = 4500 where emp_id = 5;

SELECT employees.emp_name, employees.salary, salary_range.range_name
FROM employees
JOIN salary_range
ON employees.salary BETWEEN salary_range.min_salary AND salary_range.max_salary;

