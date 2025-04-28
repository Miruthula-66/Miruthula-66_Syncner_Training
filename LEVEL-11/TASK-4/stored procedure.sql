CREATE TABLE IF NOT EXISTS department_stats (
    department VARCHAR(100) PRIMARY KEY,
    avg_salary DECIMAL(10,2)
);
DELIMITER //
CREATE PROCEDURE CalculateAvgSalary(IN dept_name VARCHAR(100))
BEGIN
    DECLARE avgSal DECIMAL(10,2);
    SELECT AVG(e.salary)
    INTO avgSal
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = dept_name;
    INSERT INTO department_stats (department, avg_salary)
    VALUES (dept_name, avgSal)
    ON DUPLICATE KEY UPDATE avg_salary = avgSal;
END //

DELIMITER ;
CALL CalculateAvgSalary('Engineering');
SELECT * FROM department_stats;

