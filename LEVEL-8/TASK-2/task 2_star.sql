CREATE DATABASE EcommerceDW_Star;
GO
USE EcommerceDW_Star;
GO
CREATE TABLE Product_Dim (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category_Name VARCHAR(50),
    Brand VARCHAR(50)
);
CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    Country VARCHAR(50)
);
CREATE TABLE Time_Dim (
    Time_ID INT PRIMARY KEY,
    Date DATE,
    Month VARCHAR(20),
    Quarter VARCHAR(10),
    Year INT
);
CREATE TABLE Store_Dim (
    Store_ID INT PRIMARY KEY,
    Store_Name VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);
CREATE TABLE Sales_Fact (
    Sale_ID INT PRIMARY KEY,
    Product_ID INT,
    Customer_ID INT,
    Time_ID INT,
    Store_ID INT,
    Quantity_Sold INT,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Product_ID) REFERENCES Product_Dim(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Dim(Customer_ID),
    FOREIGN KEY (Time_ID) REFERENCES Time_Dim(Time_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store_Dim(Store_ID)
);
INSERT INTO Product_Dim VALUES (1, 'Laptop', 'Electronics', 'Dell');
INSERT INTO Customer_Dim VALUES (101, 'Alice', 'Female', 'New York', 'USA');
INSERT INTO Time_Dim VALUES (1001, '2023-11-01', 'November', 'Q4', 2023);
INSERT INTO Store_Dim VALUES (201, 'NY Store', 'New York', 'NY', 'USA');
INSERT INTO Sales_Fact VALUES (5001, 1, 101, 1001, 201, 2, 2400.00);

SELECT 
    c.Customer_Name,
    p.Product_Name,
    t.Date,
    s.Store_Name,
    f.Quantity_Sold,
    f.Total_Amount
FROM Sales_Fact f
JOIN Customer_Dim c ON f.Customer_ID = c.Customer_ID
JOIN Product_Dim p ON f.Product_ID = p.Product_ID
JOIN Time_Dim t ON f.Time_ID = t.Time_ID
JOIN Store_Dim s ON f.Store_ID = s.Store_ID;
