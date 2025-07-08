CREATE DATABASE SCD_Demo;
GO
USE SCD_Demo;
GO
CREATE TABLE Customer_Dim (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    email VARCHAR(100),
    loyalty_tier VARCHAR(20),
    start_date DATE,
    end_date DATE,
    is_current_flag BIT -- 1 
);
GO
INSERT INTO Customer_Dim (
    customer_id, first_name, second_name, email, loyalty_tier, start_date, end_date, is_current_flag
)
VALUES (
    101, 'Jane', 'Smith', 'jane.smith@email.com', 'Bronze',
    '2023-01-01', '9999-12-31', 1
);
GO
UPDATE Customer_Dim
SET end_date = '2024-12-31', is_current_flag = 0
WHERE customer_id = 101 AND is_current_flag = 1;
GO
INSERT INTO Customer_Dim (
    customer_id, first_name, second_name, email, loyalty_tier, start_date, end_date, is_current_flag
)
VALUES (
    101, 'Jane', 'Smith', 'jane.smith@email.com', 'Gold',
    '2025-01-01', '9999-12-31', 1
);
GO
SELECT * FROM Customer_Dim
WHERE customer_id = 101;
