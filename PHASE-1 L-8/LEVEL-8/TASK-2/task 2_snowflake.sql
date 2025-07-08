CREATE DATABASE EcommerceDW_Snowflake;
GO
USE EcommerceDW_Snowflake;
GO
CREATE TABLE Product_Category_Dim (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50),
    Brand VARCHAR(50)
);
CREATE TABLE Product_Dim (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Product_Category_Dim(Category_ID)
);
CREATE TABLE Customer_Location_Dim (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Customer_Location_Dim(Location_ID)
);

-- Store Hierarchy
CREATE TABLE Store_Location_Dim (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);
CREATE TABLE Store_Dim (
    Store_ID INT PRIMARY KEY,
    Store_Name VARCHAR(100),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Store_Location_Dim(Location_ID)
);
CREATE TABLE Time_Dim (
    Time_ID INT PRIMARY KEY,
    Date DATE,
    Month VARCHAR(20),
    Quarter VARCHAR(10),
    Year INT
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
INSERT INTO Product_Category_Dim VALUES (10, 'Electronics', 'Dell');
INSERT INTO Product_Dim VALUES (1, 'Laptop', 10);
INSERT INTO Customer_Location_Dim VALUES (501, 'New York', 'USA');
INSERT INTO Customer_Dim VALUES (101, 'Alice', 'Female', 501);
INSERT INTO Store_Location_Dim VALUES (601, 'New York', 'NY', 'USA');
INSERT INTO Store_Dim VALUES (201, 'NY Store', 601);
INSERT INTO Time_Dim VALUES (1001, '2023-11-01', 'November', 'Q4', 2023);
INSERT INTO Sales_Fact VALUES (5001, 1, 101, 1001, 201, 2, 2400.00);

SELECT 
    c.Customer_Name,
    cl.City AS Customer_City,
    p.Product_Name,
    pc.Category_Name,
    pc.Brand,
    t.Date,
    s.Store_Name,
    sl.City AS Store_City,
    f.Quantity_Sold,
    f.Total_Amount
FROM Sales_Fact f
JOIN Customer_Dim c ON f.Customer_ID = c.Customer_ID
JOIN Customer_Location_Dim cl ON c.Location_ID = cl.Location_ID
JOIN Product_Dim p ON f.Product_ID = p.Product_ID
JOIN Product_Category_Dim pc ON p.Category_ID = pc.Category_ID
JOIN Time_Dim t ON f.Time_ID = t.Time_ID
JOIN Store_Dim s ON f.Store_ID = s.Store_ID
JOIN Store_Location_Dim sl ON s.Location_ID = sl.Location_ID;
