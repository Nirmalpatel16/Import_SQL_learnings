/* Module-4 Assignment


Problem Statement:
You will work with inbuilt functions and user-defined functions

Tasks to be done:
1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders
table
2. Create a user-defined function, which will multiply the given number with 10
3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and
print the corresponding value
*/
-------------------------------------------------------------------------
create database Assignment_04;
use Assignment_04;

---------------------------------------------------------------------
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
                         
----------------------------------------------------------------------------------------------------------------
##1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

SELECT 
    MIN(amount) AS Min_Amount,
    MAX(amount) AS Max_Amount,
    AVG(Amount) AS Avg_Amount
FROM
    orders;
    
-------------------------------------------------------------------------------------------------------
##2. Create a user-defined function, which will multiply the given number with 10

DELIMITER $$
CREATE FUNCTION Func_Cube
(
 Num INT
)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE TotalCube INT;
    SET TotalCube = Num * 10;
    RETURN TotalCube; 
END$$
DELIMITER ;

select func_Cube(3);
---------------------------------------------------------------------------------------------------------------------------------
##3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value

select 
  case
  when 100<200 then '100 is less than 200'
  when 100>200 then '100 is not greater than 200'
  when 100=200 then '100 is not equal to 200'
else 
    'Novalue'
End;
  










