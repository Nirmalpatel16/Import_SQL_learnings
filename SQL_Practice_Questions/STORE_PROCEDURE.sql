----------------------------------------------------------------------------------------------
--------------------STORE PROCEDURE-----------------------------------------------------------

-- The stored procedure is SQL statements wrapped within the CREATE PROCEDURE statement. 
-- The stored procedure may contain a conditional statement like IF or CASE or the Loops. 
-- The stored procedure can also execute another stored procedure or a function that modularizes the code.

-- Reduce the Network Traffic: Multiple SQL Statements are encapsulated in a stored procedure. When you execute it, instead of sending multiple queries, we are sending only the name and the parameters of the stored procedure
-- Easy to maintain: The stored procedure are reusable. We can implement the business logic within an SP, and it can be used by applications multiple times, or different modules of an application can use the same procedure. This way, a stored procedure makes the database more consistent. If any change is required, you need to make a change in the stored procedure only
-- Secure: The stored procedures are more secure than the AdHoc queries. The permission can be granted to the user to execute the stored procedure without giving permission to the tables used in the stored procedure. The stored procedure helps to prevent the database from SQL Injection
------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

-- QUESTION 1: 
-- Suppose you want to populate the list of films. The output should contain film_id, title, description, release year, and rating column. 

USE SAKILA;

DROP PROCEDURE List_of_films;
DELIMITER //
CREATE PROCEDURE List_of_films()
begin 
  select title, description , release_year, rating from film;
  SELECT * FROM RENTAL;
end //
DELIMITER ;

-- Call the procedure

CALL List_of_films();
-------------------------------------------------------------------------------------------------------
-- QUESTION 2: Suppose we want to get the list of films based on the rating. 

DROP PROCEDURE Movies_Rating;

DELIMITER //
CREATE PROCEDURE Movies_Rating(IN p_rating varchar(50),p_country varchar(50), p_film_id INT)
BEGIN 
   SELECT title,description,release_year,rating from film 
   where rating=p_rating;
   
   SELECT * FROM COUNTRY WHERE COUNTRY = p_country;
   
   SELECT F.FILM_ID,F.DESCRIPTION,F.RELEASE_YEAR,FC.CATEGORY_ID FROM FILM f
   JOIN FILM_CATEGORY fc ON f.FILM_ID=fc.FILM_ID
   WHERE F.FILM_ID = p_film_id;
END //
DELIMITER ;

-- CALL the Procedure
CALL Movies_Rating('nc-17','INDIA',1);
CALL Movies_Rating('pg','Afghanistan',2);
--------------------------------------------------------------------------------------------------
-- QUESTION 3: PROCEDURE WITHIN THE PROCEDURE

DROP PROCEDURE Call_Procedure;
DELIMITER //
CREATE PROCEDURE Call_Procedure()
BEGIN
 CALL Movies_Rating('nc-17','India',1);    -- If you have pass two parameters in procedure then while calling the procedure you pass the same number of parameters
 CALL Movies_Rating('PG', 'Austria',2);
 
END //
DELIMITER ;


CALL Call_Procedure();
---------------------------------------------------------------------------------------------------------
-- QUESTION 4: Insert_Update_Delete

DROP PROCEDURE Insert_Update_Delete;
DELIMITER //
CREATE PROCEDURE Insert_Update_Delete()
BEGIN
  drop database Store_Procedure_Practice;
  create database Store_Procedure_Practice;
  -- use Store_Procedure_Practice;
  
  
  CREATE TABLE IF NOT EXISTS Employee_Name (
  Emp_ID nVarchar(250),
  Emp_name varchar(225)
  );

 DELETE FROM Employee_Name;
 
  Insert into Employee_Name (Emp_ID,Emp_name) values 
  ('निर्मल','abc'),
  ('@pp','xyz'),
  ('@oo','xyzw'),
  ('$cah',null);
  
  select * from Employee_Name;
  
END //
DELIMITER ;

CALL Insert_Update_Delete();

---------------------------------------------------------------------------------------------------------------------------



