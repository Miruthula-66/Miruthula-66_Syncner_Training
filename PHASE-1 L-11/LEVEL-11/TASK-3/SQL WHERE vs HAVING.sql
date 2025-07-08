INSERT INTO employees (id, name, department_id, salary)
VALUES
(6, 'Fiona', 3, 50000),
(7, 'George', 3, 48000);
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering'
GROUP BY d.department_name;
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000;
SELECT * FROM departments;
INSERT INTO departments (department_id, department_name)
VALUES (4, 'Marketing');
SELECT * FROM employees WHERE name = 'Bob';
UPDATE employees
SET department_id = 4
WHERE name = 'Bob';
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000;
UPDATE employees
SET department_id = 4
WHERE id = 2;
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000;
