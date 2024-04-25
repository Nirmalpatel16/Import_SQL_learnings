/*
ASSIGNMENT 03

Problem Statement:
You will work with joins and update statement

Tasks to be done:
1. Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’,
‘customer_id’
2. Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
3. Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
4. Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3

*/
-------------------------------------------------------------------------------------
CREATE DATABASE Assignment_03;
USE Assignment_03;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
CREATE TABLE orders (
    Order_ID INT(10) PRIMARY KEY,
    Order_date DATE,
    Amount DECIMAL(18 , 2 ),
    Customer_ID INT(10)
);
---------------------------------------------------------------------------------------------------

INSERT INTO Orders VALUE (001, '2020-01-01',12347.23,2),
                         (002, '2020-01-02-',12345.23,1),
                         (003, '2020-01-03',12344.23,2),
                         (004, '2020-01-04',12343.23,4),
                         (005, '2020-01-05',12365.23,5),
                         (006, '2020-01-06',12349.23,6),
                         (007, '2020-01-07',12341.23,8),
                         (008, '2020-01-08',12340.23,9),
                         (009, '2020-01-08',12325.23,11),
                         (010, '2020-01-01',12340.23,1),
                         (011, '2020-01-04',12311.23,4);
------------------------------------------------------------------------------------------------------------------
CREATE TABLE Customers (
    Customer_ID INT(10) PRIMARY KEY,
    First_Name VARCHAR(225),
    Age INT(5)
);
-----------------------------------------------------------------------------------------------------------------
INSERT INTO Customers VALUE (1, 'A', 35),
                            (2, 'B', 45),
                            (3, 'C', 56),
                            (4, 'D', 78),
                            (5, 'E', 46),
                            (6, 'F', 32),
                            (7, 'G', 28),
                            (8, 'H', 25);

--------------------------------------------------------------------------------------------------------------------
#INNER JOIN

SELECT 
    C.Customer_ID, C.First_Name, O.Order_ID
FROM
    Customers C
        JOIN
    orders O ON c.customer_ID = o.Customer_ID;

-----------------------------------------------------------------------------------------------------------------------
#LEFT JOIN

SELECT 
    o.order_ID, c.customer_id, c.First_name
FROM
    orders o
        LEFT JOIN
    customers c ON c.customer_ID = o.customer_ID;

-------------------------------------------------------------------------------------------------------------------------
#RIGHT JOIN

SELECT 
    o.order_ID, c.customer_id, c.First_name
FROM
    orders o
        RIGHT JOIN
    customers c ON c.customer_ID = o.customer_ID;

------------------------------------------------------------------------------------------------------------------------
#UPDATE

UPDATE orders 
SET 
    amount = 100
WHERE
    customer_ID = 2;
    
-----------------------------------------------------------------------------------------------------------------------