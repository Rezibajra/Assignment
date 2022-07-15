CREATE TABLE manager (
    manager_id INT PRIMARY KEY NOT NULL,
    manager_name VARCHAR(50) NOT NULL,
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    dept_code VARCHAR(50),
    parent_dept_id INT NOT NULL,
    manager_id INT,
    description TEXT,
    active BOOLEAN NOT NULL,
    FOREIGN KEY (manager_id) REFERENCES manager(manager_id) ON DELETE CASCADE
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    join_date TIMESTAMP,
    monthly_salary REAL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE
);


INSERT INTO manager (manager_id, manager_name)
VALUES (1, 'John');
INSERT INTO manager (manager_id, manager_name)
VALUES (2, 'Jane');
INSERT INTO manager (manager_id, manager_name)
VALUES (3, 'Tom');


INSERT INTO department (dept_id, dept_name, dept_code, parent_dept_id, manager_id, description, active) 
VALUES (1, 'Sales', '101', 1, 1, 'Sales Department', True);
INSERT INTO department (dept_id, dept_name, dept_code, parent_dept_id, manager_id, description, active) 
VALUES (2, 'IT', '201', 2, 2, 'IT Department', True);
INSERT INTO department (dept_id, dept_name, dept_code, parent_dept_id, manager_id, description, active) 
VALUES (3, 'Finance', '301', 3, 3, 'Finance Department', True);


INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (1, 'Kris', 'K', 'Perk', '2016-06-22 19:10:25-07', 25000, 2);
INSERT INTO employee (employee_id, first_name, last_name, join_date, monthly_salary, dept_id)
VALUES (2, 'Olive', 'Tree', '2019-06-22 19:10:29-07', 20000, 2);
INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (3, 'Pegg', 'P', 'Legge', '2018-06-22 19:10:25-07', 5000, 3);
INSERT INTO employee (employee_id, first_name, last_name, join_date, monthly_salary, dept_id)
VALUES (4, 'Rose', 'Bush', '2006-06-22 19:10:25-07', 50000, 1);
INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (5, 'Lee', 'A', 'Sun', '2021-06-22 15:10:25-07', 25000, 1);
INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (6, 'Kris', 'Q', 'Perk', '2019-06-22 19:10:25-07', 60000, 3);
INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (7, 'Hugo', 'Pink', 'Quil', '2009-06-22 19:10:25-07', 60000.22, 3);
INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (8, 'Platy', 'P', 'Plus', '2022-06-22 00:00:00', 94000.23, 1);
INSERT INTO employee (employee_id, first_name, middle_name, last_name, join_date, monthly_salary, dept_id)
VALUES (9, 'Rebeca', 'Rp', 'Brick', '2022-03-02 00:10:00', 99000.23, 1);

-- 1. Write a Single Query to find the Total Earnings by Employees grouped by Departments.
SELECT dept_name, SUM(((DATE_PART('year', NOW()::date) - DATE_PART('year', employee.join_date::date)) * 12 +
       (DATE_PART('month', NOW()::date) - DATE_PART('month', join_date::date)))* employee.monthly_salary) AS TOTAL_SALARY
FROM department INNER JOIN employee 
ON department.dept_id = employee.dept_id
GROUP BY department.dept_name;

-- 2. Write a Single Query to find the list of Employees belonging to Department Sales, with service length of more than 6 months.
SELECT employee_id, first_name, 
       middle_name, last_name, 
       join_date, monthly_salary, 
       dept_name
FROM employee INNER JOIN department 
ON department.dept_id = employee.dept_id
AND department.dept_name = 'Sales'
AND ((DATE_PART('year', NOW()::date) - DATE_PART('year', join_date::date)) * 12 +
    (DATE_PART('month', NOW()::date) - DATE_PART('month', join_date::date))) > 6;

-- 3. Write a Single Query to list Employees with their Department Name and their Manager Name.
SELECT employee_id, first_name, 
       middle_name, last_name, 
       join_date, monthly_salary, 
       dept_name, manager_name
FROM employee, department, manager 
WHERE manager.manager_id = department.manager_id 
AND employee.dept_id = department.dept_id;