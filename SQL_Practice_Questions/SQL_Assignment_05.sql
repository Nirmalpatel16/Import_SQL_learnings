Create database Assignment_5;
use Assignment_5
---------------------------------------------------------------------------------------------------------------
CREATE TABLE Employee_Table(

       Employee_ID INT PRIMARY KEY,
	   First_Name VARCHAR(225),
	   Last_Name VARCHAR(225),
	   Salary INT,
	   Joining_Date DATETIME,
	   Department VARCHAR(50)
);

INSERT INTO Employee_Table
                        VALUES  (1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
                                (2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
				(3,'Vishal','Singhal',3000000,'2020-02-16 9:00:00','HR'),
				(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
				(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
				(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
				(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
				(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin'); 
					

CREATE TABLE Employee_Bonus(

       Employee_ref_ID INT,
	   Bonus_Amount INT,
	   Bonus_Date DATETIME
	  
);

INSERT INTO Employee_Bonus VALUES (1,5000,'2020-02-16 0:00:00'),
                                  (2,3000,'2011-06-16 0:00:00'),
								  (3,4000,'2020-02-16 0:00:00'),
								  (1,4500,'2020-02-16 0:00:00'),
								  (2,3500,'2011-06-16 0:00:00');

drop table employee_title;
CREATE TABLE Employee_Title(

       Employee_ref_ID INT,
	   Employee_title VARCHAR(200),
	   Activity_Date DATETIME
);


INSERT INTO Employee_Title VALUES (1,'Manager','2016-02-20 0:00:00'),
                                  (2,'Executive','2016-06-20 0:00:00'),
								  (8,'Executive','2016-06-20 0:00:00'),
								  (5,'Manager','2016-06-20 0:00:00'),
								  (4,'Asst. Manager','2016-06-20 0:00:00'),
								  (7,'Executive','2016-06-20 0:00:00'),
								  (6,'Lead','2016-06-20 0:00:00'),
								  (3,'Lead','2016-06-20 0:00:00');

----------------------------------------------------------------------------------------------------------------------------
--Tasks To Be Performed:

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

SELECT 
   First_name AS Employee_name 
     FROM 
     Employee_Table;
------------------------------------------------------------------------------------------------------------------------------
--2 Display “LAST_NAME” from Employee table in upper case.

SELECT
    UPPER(last_name) 
	FROM 
	Employee_Table;

---------------------------------------------------------------------------------------------------------------------------
--3 Display unique values of DEPARTMENT from EMPLOYEE table.

SELECT 
    DISTINCT(Department)
	FROM
	Employee_table;

-------------------------------------------------------------------------------------------------------------------------------
--4 Display the first three characters of LAST_NAME from EMPLOYEE table

SELECT
    LEFT(Last_name,3) AS last_name
	FROM 
	Employee_Table;

------------------------------------------------------------------------------------------------------------------------------
--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

SELECT 
    distinct(len(Department)) 
	From 
	Employee_Table;

------------------------------------------------------------------------------------------------------------------------------
--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. a space char should separate them.

Select 
    concat(First_name, ' ', last_name) AS Full_name
	from
	Employee_Table;

-------------------------------------------------------------------------------------------------------------------------------
--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

SELECT 
    *
	FROM
	   Employee_table
	ORDER BY First_Name;

--------------------------------------------------------------------------------------------------------------------------------
--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT 
    *
	FROM
	Employee_Table
	order by First_name asc, Department desc;

----------------------------------------------------------------------------------------------------------------------------------
--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

SELECT 
   * 
   FROM Employee_Table 

   WHERE first_name IN ('veena', 'Karan');

--------------------------------------------------------------------------------------------------------------------------------
--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

SELECT 
    * 
	FROM Employee_Table 
	where department = 'admin';

-------------------------------------------------------------------------------------------------------------------------------
--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

SELECT 
    * 
	FROM Employee_Table
	WHERE first_name like 'v%';

-------------------------------------------------------------------------------------------------------------------------------
--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

SELECT 
   *
   FROM Employee_Table

   WHERE Salary BETWEEN 100000 AND 500000;

---------------------------------------------------------------------------------------------------------------------------------
--13 Display details of the employees who have joined in Feb-2020.

SELECT 
     * 
	 FROM Employee_Table
	 WHERE Year(Joining_Date)=2020 and MONTH(Joining_Date)=02;

---------------------------------------------------------------------------------------------------------------------------------	
--14 Display employee names with salaries >= 50000 and <= 100000.

SELECT 
    * 
	 FROM Employee_Table
	 WHERE Salary >= 50000 AND Salary <= 100000; 
---------------------------------------------------------------------------------------------------------------------------------
--15 DISPLAY details of the EMPLOYEES who are also Managers.

Select * from employee_table where department = 'manager';
select * from employee_table;
select * from employee_bonus;
select * from employee_title;

SELECT 
    ed.*, et.*
FROM
    employee_table ed
        JOIN
    employee_title et
WHERE
    et.employee_title = 'Manager';
    
--------------------------------------------------------------------------------------------------------------------------------
--16 DISPLAY duplicate records having matching data in some fields of a table.
------------------------------------------------------------------------------------------------------------------------------
--17 Display only odd rows from a table.

SELECT 
    *
FROM
    Employee_table
WHERE
    MOD(employee_ID, 2) = 1;
    
-------------------------------------------------------------------------------------------------------------------------------
--18 Clone a new table from EMPLOYEE table.

CREATE TABLE Employee_table_duplicate LIKE Employee_table;
Insert into Employee_table_duplicate select * from Employee_table;

---------------------------------------------------------------------------------------------------------------------------------
--19 DISPLAY the TOP 2 highest salary from a table.

SELECT 
    salary
FROM
    employee_table
ORDER BY salary DESC
LIMIT 2; 
---------------------------------------------------------------------------------------------------------------------------------
--20. DISPLAY the list of employees with the same salary.
       
SELECT 
    *
FROM
    employee_table
WHERE
    salary IN (SELECT 
            salary
        FROM
            employee_table
        GROUP BY salary
        HAVING COUNT(1) > 1);
---------------------------------------------------------------------------------------------------------------------------------
--21 Display the second highest salary from a table.

SELECT 
    *
FROM
    employee_table
GROUP BY salary
ORDER BY salary DESC
LIMIT 1 , 1;

--------------------------------------------------------------------------------------------------------------------------------
--22 Display the first 50% records from a table

SELECT 
    *
FROM
    Employee_table
WHERE
    Employee_ID <= (SELECT 
            COUNT(Employee_ID) / 2
        FROM
            Employee_table);
--------------------------------------------------------------------------------------------------------------------------------
--23 Display the departments that have less than 4 people in it

SELECT 
    *
FROM
    employee_table
GROUP BY department
HAVING COUNT(department) < 4;
----------------------------------------------------------------------------------------------------------------------------------------
--24 Display all departments along with the number of people in there.

SELECT 
    department, COUNT(employee_ID)
FROM
    employee_table
GROUP BY department;
----------------------------------------------------------------------------------------------------------------------
##25 Display the name of employees having the highest salary in each department

select 
     a.First_name, 
     a.Salary, 
     a.department 
from
        (select First_name, 
                salary, 
                department, 
                row_number () over(partition by department order by salary desc) as Row1 
         from employee_table) as a
         where a.row1 = 1;
--------------------------------------------------------------------------------------------------------------------------------
##26 Display the names of employees who earn the highest salary.

select First_name, max(salary) from employee_table;

---------------------------------------------------------------------------------------------------------------------------------
##27 Display the average salaries for each department

SELECT 
    Department, AVG(salary)
FROM
    employee_table
GROUP BY department;

---------------------------------------------------------------------------------------------------------------------------------
##28 display the name of the employee who has got maximum bonus

SELECT 
    et.first_name, et.employee_ID, MAX(eb.bonus_amount)
FROM
    employee_table et
        JOIN
    employee_bonus eb ON et.employee_ID = eb.employee_ref_ID;
---------------------------------------------------------------------------------------------------------------------------------
##29 Display the first name and title of all the employees

SELECT 
    et.first_name, ett.employee_title
FROM
    employee_table et
        JOIN
    employee_title ett ON et.employee_ID = ett.employee_ref_ID;
    
---------------------------------------------------------------------------------------------------------------------------------












