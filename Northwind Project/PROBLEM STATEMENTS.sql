------------------------------------------------------------------------------
######-----------NORTHWIND PRCTICE QUERIES------------------------------#######
------------------------------------------------------------------------------

-- 1. Which shippers do we have?--
SELECT 
    *
FROM
    shippers;
-- or --
SELECT 
    companyname AS shipper_name
FROM
    shippers;
-----------------------------------------------------------------------------------------
-- 2. Display only two columns, CategoryName and Description --
SELECT 
    categoryname, description
FROM
    categories;

----------------------------------------------------------------------------------------------
-- 3. We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. Write a SQL statement that returns only those employees. -- 
SELECT 
    FirstName, LastName, HireDate
FROM
    employees
WHERE
    Title = 'sales representative';

-----------------------------------------------------------------------------------------------
-- 4. Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative and are in the United States.--
SELECT 
    FirstName, LastName, HireDate
FROM
    employees
WHERE
    Title = 'sales representative'
        AND Country = 'USA';

------------------------------------------------------------------------------------------------
-- 5. Show all the orders placed by a specific employee. The EmployeeID for this Employee is 5 --
SELECT 
    *
FROM
    orders
WHERE
    EmployeeID = '5';

-----------------------------------------------------------------------------------------------
-- 6. In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager --
SELECT 
    SupplierID, ContactName, ContactTitle
FROM
    suppliers
WHERE
    ContactTitle != 'Marketing Manager';

---------------------------------------------------------------------------------------------------
-- 7. In the products table, we’d like to see the ProductID and ProductName for those products where the ProductName includes the string “queso” --
SELECT 
    productid, productname
FROM
    products
WHERE
    productname LIKE '%queso%';
    
---------------------------------------------------------------------------------------------------    
    -- 8.	Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium. --
SELECT 
    OrderID, CustomerID, ShipCountry
FROM
    orders
WHERE
    ShipCountry IN ('France' , 'Belgium');
    
    
----------------------------------------------------------------------------------------------------
    
    -- 	9.	Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the orders from any Latin American country. But we don’t have a list of Latin American countries in a table in the Northwind database. So, we’re going to just use this list of Latin American countries that happen to be in the Orders table: --
SELECT 
    OrderID, CustomerID, ShipCountry AS Latin_country
FROM
    orders
WHERE
    ShipCountry IN ('Brazil' , 'Mexico', 'Argentina', 'Venezuela');
    
---------------------------------------------------------------------------------------------------------    
    -- 10.	For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first.--
SELECT 
    FirstName, LastName, Title, BirthDate
FROM
    employees
ORDER BY (birthdate);

--------------------------------------------------------------------------------------------------------
-- 11.	In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field.--
SELECT 
    FirstName, LastName, Title, date(BirthDate ) as Date
FROM
    employees
ORDER BY (birthdate);
----------------------------------------------------------------------------------------------------------
-- 12.	Show the FirstName and LastName columns from the Employees table, and then create a new column called FullName, showing FirstName and LastName joined together in one column, with a space inbetween--
SELECT 
    EmployeeID, CONCAT(firstname, ' ', lastname) AS 'Full name'
FROM
    employees;
-----------------------------------------------------------------------------------------------------------    
    -- 13.	In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that multiplies these two together. We’ll ignore the Discount field for now. In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.--
SELECT 
    OrderID,
    ProductID,
    UnitPrice,
    Quantity,
    (quantity * unitprice) AS totalprice
FROM
    `order details`
ORDER BY 'orderid' , 'productid';
------------------------------------------------------------------------------------------------------
-- 14.	How many customers do we have in the Customers table? Show one value only, and don’t rely on getting the recordcount at the end of a resultset --
SELECT 
    COUNT(DISTINCT customerID) as  "no of customers"
FROM
    customers;
--------------------------------------------------------------------------------------------------------    
    -- 15.	Show the date of the first order ever made in the Orders table --
   SELECT 
    DATE(orderdate) AS first_order_placed_on
FROM
    orders
ORDER BY orderdate
LIMIT 1;
-- or--

SELECT min(date(orderdate)) from orders;
----------------------------------------------------------------------------------------------------------
-- 16.	Show a list of countries where the Northwind company has customers.--
SELECT 
    country
FROM
    customers
WHERE
    country IS NOT NULL;
-------------------------------------------------------------------------------------------------------------    
    -- 17.	Show a list of all the different values in the Customers table for ContactTitles. Also include a count for each ContactTitle. This is similar in concept to the previous question “Countries where there are customers”, except we now want a count for each ContactTitle--
   SELECT 
    ContactTitle, COUNT(contacttitle)
FROM
    customers
GROUP BY ContactTitle;

-------------------------------------------------------------------------------------------------------------
-- 18.	We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID. This question will introduce what may be a new concept, the Join clause in SQL. The Join clause is used to join two or more relational database tables together in a logical way--
SELECT 
    products.productid,
    products.productname,
    suppliers.CompanyName AS associated_supplier_name
FROM
    products
        INNER JOIN
    suppliers ON products.SupplierID = suppliers.SupplierID
ORDER BY ProductID;
---------------------------------------------------------------------------------------------------------------
-- 19.	We’d like to show a list of the Orders that were made, including the Shipper that was used. Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID. In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.--
SELECT 
    OrderID, date(orderdate) , companyname
FROM
    orders
        INNER JOIN
    shippers ON orders.shipvia = shippers.ShipperID
WHERE
    orderid < '10300'
ORDER BY orderid; 

---------------------------------------------------------------------------------------------------------
-- 20.	For this problem, we’d like to see the total number of products in each category. Sort the results by the total number of products, in descending order.--
SELECT 
    categoryid, count(ProductID)as "no of products "
FROM
    products
GROUP BY CategoryID
ORDER BY CategoryID DESC;
---------------------------------------------------------------------------------------------------------
-- 21 Select CategoryName and Description from the Categories table sorted by CategoryName.

SELECT 
    categoryname, description
FROM
    categories
ORDER BY categoryname;

-----------------------------------------------------------------------------------
-- 22 Select ContactName, CompanyName, ContactTitle, and Phone from the Customers table sorted byPhone

SELECT 
    contactname, companyname, contacttitle, phone
FROM
    customers
ORDER BY phone;

------------------------------------------------------------------------------------------------------------
-- 23 Create a report showing employees' first and last names and hire dates sorted from newest to oldestemployee

SELECT 
    firstname, lastname, hiredate
FROM
    employees
ORDER BY hiredate DESC;

--------------------------------------------------------------------------------------------------------------
-- 24  Create a report showing Northwind's orders sorted by Freight from most expensive to cheapest.
#Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight.

SELECT 
    orderid, orderdate, shippeddate, customerid, freight
FROM
    orders
ORDER BY freight DESC;

----------------------------------------------------------------------------------------------------------------
-- 25 Select CompanyName, Fax, Phone, HomePage and Country from the Suppliers table sorted byCountry in descending order and then by CompanyName in ascending order.

SELECT 
    companyname, fax, phone, homepage, country
FROM
    suppliers
ORDER BY country DESC , companyname ASC;

-------------------------------------------------------------------------------------------------------------------
-- 26 Create a report showing all the company names and contact names of Northwind's customers in Buenos Aires

SELECT 
    companyname, contactname
FROM
    customers
WHERE
    country = '%buenos aires%';

-------------------------------------------------------------------------------------------------------------------

-- 27 Create a report showing the product name, unit price and quantity per unit of all products that are out of stock.

SELECT 
    productname, unitprice, quantityperunit
FROM
    products
WHERE
    unitsinstock LIKE 0;  # we can also use mathematical expression (where unitsinstock <= 0)

-----------------------------------------------------------------------------------------------------------------

-- 28 Create a report showing the order date, shipped date, customer id, and freight of all orders placed onMay 19, 1997

SELECT 
    orderdate, shippeddate, customerid, freight
FROM
    orders
WHERE
    DATE(orderdate) >= '1997-05-19'
ORDER BY orderdate;

-------------------------------------------------------------------------------------------------------------------

-- 29 Create a report showing the first name, last name, and country of all employees not in the UnitedStates

SELECT 
    firstname, lastname, country
FROM
    employees
WHERE
    country NOT LIKE 'usa';

------------------------------------------------------------------------------------------------------------------
-- 30 Create a report that shows the employee id, order id, customer id, required date, and shipped date of all orders that were shipped later than they were required.

SELECT 
    employeeid, orderid, customerid, requireddate, shippeddate
FROM
    orders
WHERE
    requireddate < shippeddate;

-----------------------------------------------------------------------------------------------------------------
-- 31 Create a report that shows the city, company name, and contact name of all customers who are in cities that begin with "A" or "B."

SELECT 
    city, companyname, contactname
FROM
    customers
WHERE
    contactname LIKE 'a%_' OR 'b%_';

------------------------------------------------------------------------------------------------------------------
-- 32 Create a report that shows all orders that have a freight cost of more than $500.00

SELECT 
    orderid, customerid, freight
FROM
    orders
WHERE
    freight > 500;

--------------------------------------------------------------------------------------------------------------------------
-- 33 Create a report that shows the product name, units in stock, units on order, and reorder level of all products that are up for reorder

SELECT 
    productname, unitsinstock, unitsonorder, reorderlevel
FROM
    products
WHERE
    reorderlevel > 0
ORDER BY reorderlevel;

-------------------------------------------------------------------------------------------------------------------------
-- 34 Create a report that shows the company name, contact name and fax number of all customers thathave a fax number.

SELECT 
    companyname, contactname, fax
FROM
    customers
WHERE
    fax IS NOT NULL;

-------------------------------------------------------------------------------------------------------------------------
-- 35 Create a report that shows the first and last name of all employees who do not report to anybody

SELECT 
    firstname, lastname, reportsto
FROM
    employees
WHERE
    reportsto IS NULL;

-----------------------------------------------------------------------------------------------------------------------------
-- 36 Create a report that shows the company name, contact name and fax number of all customers that have a fax number. Sort by company name.

SELECT 
    companyname, contactname, fax
FROM
    customers
WHERE
    fax IS NOT NULL
ORDER BY companyname;

------------------------------------------------------------------------------------------------------------------------------
-- 37 Create a report that shows the city, company name, and contact name of all customers who are in cities that begin with "A" or "B." Sort by contact name in descending order

SELECT 
    city, companyname, contactname
FROM
    customers
WHERE
    city LIKE 'a%' OR 'b%'
ORDER BY contactname DESC;

--------------------------------------------------------------------------------------------------------------------------------
-- 38 Create a report that shows the first and last names and birth date of all employees born in the 1950s

SELECT 
    firstname, lastname, birthdate
FROM
    employees
WHERE
    birthdate LIKE '%1952%';

-------------------------------------------------------------------------------------------------------------------------------
-- 39 Create a report that shows the product name and supplier id for all products supplied by ExoticLiquids, Grandma Kelly's Homestead, and Tokyo Traders.


SELECT 
    products.productname,
    products.supplierid,
    suppliers.companyname
FROM
    products
        INNER JOIN
    suppliers ON products.supplierid = suppliers.supplierid
WHERE
    suppliers.companyname IN ('Exotic Liquids' , 'Grandma Kelly\'s Homestead',
        'Tokyo Traders');

######OR

SELECT 
    p.productname, p.supplierid
FROM
    PRODUCTS p
WHERE
    p.supplierid IN (SELECT 
            s.supplierid
        FROM
            SUPPLIERS s
        WHERE
            s.companyname IN ('Exotic Liquids' , 'Tokyo Traders',
                'Grandma Kelly\'s Homestead'));

-----------------------------------------------------------------------------------------------------------------------------
-- 40 Create a report that shows the shipping postal code, order id, and order date for all orders with a ship postal code beginning with "02389"

SELECT 
    shippostalcode, orderid, orderdate
FROM
    orders
WHERE
    shippostalcode LIKE '02389%';

-------------------------------------------------------------------------------------------------------------------------------
-- 41 Create a report that shows the contact name and title and the company name for all customers whose contact title does not contain the word "Sales".

SELECT 
    contactname, contacttitle, companyname
FROM
    customers
WHERE
    contacttitle NOT LIKE '%sales%';

-----------------------------------------------------------------------------------------------------------------------------------
-- 42 Create a report that shows the first and last names and cities of employees from cities other than Seattle in the state of Washington

SELECT 
    firstname, lastname, city
FROM
    employees
WHERE
    city NOT LIKE '%seattle%';

----------------------------------------------------------------------------------------------------------------------------------
-- 43 Create a report that shows the company name, contact title, city and country of all customers in Mexico or in any city in Spain except Madrid

SELECT 
    companyname, contacttitle, city, country
FROM
    customers
WHERE
    city NOT LIKE '%madrid';
    
--------------------------------------------------END OF FILE----------------------------------------------------------------