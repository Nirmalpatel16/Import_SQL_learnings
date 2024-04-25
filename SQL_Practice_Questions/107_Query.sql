/*Assignment – SQL Queries 107
Problem Statement:
You have been given the below tasks to complete using
the Table – STUDIES, SOFTWARE & PROGRAMMER.
*/

Create database Handson;
use Handson;

-- Studies Table
Drop table Studies;
CREATE TABLE Studies (
    PNAME VARCHAR(20),
    INSTITUTE VARCHAR(20),
    COURSE VARCHAR(20),
    COURSE_FEE INT
);
-- Insertion
INSERT INTO Studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000;



-- Software Table
Drop table software;
CREATE TABLE Software (
    PNAME VARCHAR(20),
    TITLE VARCHAR(20),
    DEVELOPIN VARCHAR(20),
    SCOST DECIMAL(10 , 2 ),
    DCOST INT,
    SOLD INT
);

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View

 -- Programmer Table
 drop table programmer;
 CREATE TABLE Programmer (
    PNAME VARCHAR(20),
    DOB DATE,
    DOJ DATE,
    GENDER VARCHAR(2),
    PROF1 VARCHAR(20),
    PROF2 VARCHAR(20),
    SALARY INT
);
 -- Insert
INSERT INTO Programmer
SELECT 'ANAND','1966-04-12','1992-04-21','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','1964-07-02','1990-11-13','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','1960-01-31','1990-04-21','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','1968-10-30','1992-01-02','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','1970-06-24','1991-02-01','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','1985-09-11','1989-10-11','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','1965-11-10','1990-04-21','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','1965-08-31','1991-04-21','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','1967-05-03','1998-02-28','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','1967-01-01','1990-12-01','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','1970-04-19','1993-04-20','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','1969-12-02','1992-01-02','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','1965-12-14','1992-05-02','F','FOXPRO','C',3500;
-- View

select * from Software;
select * from Programmer;
select * from Studies;
select course, min(COURSE_FEE) as fees from studies;
---------------------------------------------------------
#1. Find out the selling cost AVG for packages developed in Pascal.

SELECT 
    AVG(Scost * sold) AS AvgCost
FROM
    Software
WHERE
    developin = 'pascal';
---------------------------------------------------------------------------------------------------------------------------
#2. Display Names, Ages of all Programmers.

SELECT 
    pname,
    dob,
    CURDATE(),
    TIMESTAMPDIFF(year, dob, CURDATE()) AS age
FROM
    programmer
    order by age desc;

--------------------------------------------------------------------------------------------------------------------------
##3. Display the Names of those who have done the DAP Course.

SELECT 
    Pname, course
FROM
    studies
WHERE
    course = 'DAP';

-----------------------------------------------------------------------------------------------------------------------------
##4. Display the Names and Date of Births of all Programmers Born in January.

SELECT 
    pname, dob
FROM
    programmer
WHERE
    dob LIKE '%01%';
--------------------------------------------------------------------------------------------------------------------------------
##5. What is the Highest Number of copies sold by a Package?

SELECT 
    Pname, MAX(sold)
FROM
    software
GROUP BY pname
ORDER BY sold DESC
limit 2;
--------------------------------------------------------------------------------------------------------------------------------
##6. Display lowest course Fee.

SELECT 
    pname, MIN(course_fee)
FROM
    studies;
-------------------------------------------------------------------------------------------------------------------------------
##7. How many programmers done the PGDCA Course?

SELECT 
    COUNT(pname) AS Counts
FROM
    studies
WHERE
    course = 'pgdca';
-------------------------------------------------------------------------------------------------------------------------------
##8. How much revenue has been earned thru sales of Packages Developed in C.

SELECT 
    pname, developin, (scost * sold) AS Revenue
FROM
    software
WHERE
    developin = 'c';
--------------------------------------------------------------------------------------------------------------------------------
##9. Display the Details of the Software Developed by Ramesh.

SELECT 
    *
FROM
    software
WHERE
    pname = 'ramesh';
---------------------------------------------------------------------------------------------------------------------------------
##10. How many Programmers Studied at Sabhari?

SELECT 
    institute, COUNT(pname)
FROM
    studies
WHERE
    institute = 'sabhari';
---------------------------------------------------------------------------------------------------------------------------------

------------------------------------
##11. Display details of Packages whose sales crossed the 2000 Mark.

SELECT 
    *
FROM
    SOFTWARE
WHERE
    SCOST * SOLD - DCOST > 2000;
--------------------------------------------------------------------------------------------------------------------------------
##12. Display the Details of Packages for which Development Cost have been recovered.

SELECT 
    *, (scost * sold) AS sales
FROM
    software
GROUP BY developin
HAVING sales > dcost;
---------------------------------------------------------------------------------------------------------------------------------
##13. What is the cost of the costliest software development in Basic?

SELECT 
    developin, MAX(scost)
FROM
    software
WHERE
    developin = 'basic';
---------------------------------------------------------------------------------------------------------------------------------
##14. How many Packages Developed in DBASE?

SELECT 
    *
FROM
    software
WHERE
    developin = 'DBASE';
---------------------------------------------------------------------------------------------------------------------------------
##15. How many programmers studied in Pragathi?

SELECT 
    *
FROM
    STUDIES
WHERE
    INSTITUTE = 'PRAGATHI';
--------------------------------------------------------------------------------------------------------------------------------
##16. How many Programmers Paid 5000 to 10000 for their course?

SELECT 
    *
FROM
    studies
WHERE
    course_fee BETWEEN 5000 AND 10000
GROUP BY pname;
---------------------------------------------------------------------------------------------------------------------------------
##17. What is AVG Course Fee

SELECT 
    course, AVG(course_fee)
FROM
    studies
GROUP BY course; 
--------------------------------------------------------------------------------------------------------------------------------
##18. Display the details of the Programmers Knowing C.

SELECT 
    *
FROM
    programmer
WHERE
    prof1 = 'c' OR prof2 = 'c';
---------------------------------------------------------------------------------------------------------------------------------
##19. How many Programmers know either COBOL or PASCAL.

SELECT 
    *
FROM
    programmer
WHERE
    prof1 IN ('cobol' , 'pascal')
        OR prof2 IN ('cobol' , 'pascal');
---------------------------------------------------------------------------------------------------------------------------------
##20. How many Programmers Don’t know PASCAL and C

SELECT 
    *
FROM
    programmer
WHERE
    prof1 NOT IN ('pascal' , 'c')
        AND prof2 NOT IN ('pascal' , 'c');
------------------------------------------------------------------------------------------------------------------------------
##21. How old is the Oldest Male Programmer.

SELECT 
    pname, CURDATE(), TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM
    programmer
WHERE
    gender = 'm'
ORDER BY age DESC
LIMIT 1; 

--------------------------------------------------------------------------------------------------------------------------------
##22. What is the AVG age of Female Programmers?

SELECT 
    gender,
    CURDATE(),
    AVG(TIMESTAMPDIFF(YEAR, dob, CURDATE())) AS age
FROM
    programmer
WHERE
    gender = 'f';
--------------------------------------------------------------------------------------------------------------------------------
##23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

SELECT 
    pname, TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS experience
FROM
    programmer
ORDER BY pname DESC;
---------------------------------------------------------------------------------------------------------------------------------
##24. Who are the Programmers who celebrate their Birthday’s During the Current Month?

SELECT 
    *
FROM
    programmer
WHERE
    MONTH(dob) = MONTH(NOW());
---------------------------------------------------------------------------------------------------------------------------------
##25. How many Female Programmers are there?

SELECT 
    COUNT(gender)
FROM
    programmer
WHERE
    gender = 'f';
---------------------------------------------------------------------------------------------------------------------------------
##26. What are the Languages studied by Male Programmers.

SELECT 
    p.pname, p.gender, s.course
FROM
    programmer p
        JOIN
    studies s ON p.pname = s.pname
WHERE
    p.gender = 'm';
---------------------------------------------------------------------------------------------------------------------------------
##27. What is the AVG Salary?

SELECT 
    AVG(salary) AS AvgSalary
FROM
    programmer;
---------------------------------------------------------------------------------------------------------------------------------
##28. How many people draw salary 2000 to 4000?

SELECT 
    pname, salary
FROM
    programmer
WHERE
    salary BETWEEN 2000 AND 4000;
---------------------------------------------------------------------------------------------------------------------------------
##29. Display the details of those who don’t know Clipper, COBOL or PASCAL.

SELECT 
    pname, prof1, prof2
FROM
    programmer
WHERE
    prof1 NOT IN ('cliper' , 'cobol', 'pascal')
        AND prof2 NOT IN ('cliper' , 'cobol', 'pascal');
---------------------------------------------------------------------------------------------------------------------------------
##30. Display the Cost of Package Developed By each Programmer.

select pname, 
       dcost, 
       title, 
       row_number() over(partition by pname) as Row1 
       from software;
--------------------------------------------------------------------------------------------------------------------------------
##31. Display the sales values of the Packages Developed by the each Programmer.

select pname, 
       (scost*sold) as sales, 
       title, 
       row_number() over(partition by pname) as Row1 
       from software;
---------------------------------------------------------------------------------------------------------------------------------
##32. Display the Number of Packages sold by Each Programmer.

SELECT 
    pname, SUM(sold)
FROM
    software
GROUP BY pname;
--------------------------------------------------------------------------------------------------------------------------------
##33. Display the sales cost of the packages Developed by each Programmer Language wise.

SELECT 
    pname, (sold * scost) AS sales, developin, title
FROM
    software
ORDER BY developin;
---------------------------------------------------------------------------------------------------------------------------------
##34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.

SELECT 
    Developin,
    AVG(dcost) AS AvgDevelopmentCost,
    AVG(scost) AS AvgSellingCost,
    AVG((scost * sold) / sold) AS AvgPricePerCopy
FROM
    software
GROUP BY developin
ORDER BY developin;
---------------------------------------------------------------------------------------------------------------------------------
##35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.

SELECT 
    p.pname, p.gender, MAX(s.dcost), MIN(s.dcost)
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
GROUP BY p.pname; 
---------------------------------------------------------------------------------------------------------------------------------
##36. Display each institute name with number of Courses, Average Cost per Course.

SELECT 
    Institute,
    COUNT(course) AS CourseNumber,
    AVG(course_fee) AS AvgCourseFee
FROM
    studies
GROUP BY institute;
---------------------------------------------------------------------------------------------------------------------------------
##37. Display each institute Name with Number of Students.

SELECT 
    institute, COUNT(Pname)
FROM
    studies
GROUP BY institute;
---------------------------------------------------------------------------------------------------------------------------------
##38. Display Names of Male and Female Programmers. Gender also.

SELECT 
    Pname, gender
FROM
    programmer
ORDER BY gender;
---------------------------------------------------------------------------------------------------------------------------------
##39. Display the Name of Programmers and Their Packages.

SELECT 
    pname, title
FROM
    software
ORDER BY pname;
---------------------------------------------------------------------------------------------------------------------------------
##40. Display the Number of Packages in Each Language Except C and C++.

SELECT 
    developin, COUNT(title)
FROM
    software
WHERE
    developin NOT IN ('c')
GROUP BY developin;
---------------------------------------------------------------------------------------------------------------------------------
##41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.

SELECT 
    title, developin, dcost
FROM
    software
WHERE
    dcost < 1000;
---------------------------------------------------------------------------------------------------------------------------------
##42. Display AVG Difference between SCOST, DCOST for Each Package.

SELECT 
    title, AVG(ABS(scost - dcost)) AS Difference
FROM
    software
GROUP BY title;
---------------------------------------------------------------------------------------------------------------------------------
##43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.

SELECT 
    pname,
    (scost * sold) as TotalCost,
    dcost,
    ABS(dcost - scost * sold) AS CostRecovered
FROM
    software
WHERE
    scost * sold < dcost;
---------------------------------------------------------------------------------------------------------------------------------
##44. Display Highest, Lowest and Average Salaries for those earning more than 2000.

SELECT 
    MAX(salary) AS MaxSalary,
    MIN(salary) AS MinSalary,
    AVG(salary) AS AvgSalary
FROM
    programmer
WHERE
    salary > 2000;
--------------------------------------------------------------------------------------------------------------------------------
##45. Who is the Highest Paid C Programmers?

SELECT 
    p.pname, MAX(p.salary), s.developin
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
WHERE
    s.developin = 'c';
----------------------------------------------------------------------------------------------------------------------------------
##46. Who is the Highest Paid Female COBOL Programmer?

SELECT 
    p.pname, max(p.salary), p.gender, s.developin
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
WHERE
    s.developin = 'cobol' and gender = 'f';
---------------------------------------------------------------------------------------------------------------------------------
##47. Display the names of the highest paid programmers for each Language.

SELECT 
    p.pname, max(p.salary), s.developin
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
group by s.developin;
----------------------------------------------------------------------------------------------------------------------------------
##48. Who is the least experienced Programmer.

SELECT 
    pname, (TIMESTAMPDIFF(YEAR, doj, CURDATE())) AS LeastExperience
FROM
    programmer order by LeastExperience asc limit 1;
    
--------------------------------------------------------------------------------------------------------------------------------
##49. Who is the most experienced male programmer knowing PASCAL.

SELECT 
    pname,
    TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS MostExperienced,
    prof1,
    prof2,
    gender
FROM
    programmer
WHERE
    (prof1 = 'pascal' OR prof2 = 'pascal')
        AND gender = 'm'
ORDER BY MostExperienced desc
LIMIT 1;
--------------------------------------------------------------------------------------------------------------------------------
##50. Which Language is known by only one Programmer?
select * from programmer;

---------------------------------------------------------------------------------------------------------------------------------
##51. Who is the Above Programmer Referred in 50?
---------------------------------------------------------------------------------------------------------------------------------
##52. Who is the Youngest Programmer knowing DBASE?

SELECT 
    pname,
    TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS YonugestProgrammer,
    prof1,
    prof2
FROM
    programmer
WHERE
    prof1 IN ('dbase') OR prof2 IN ('dbase')
ORDER BY YonugestProgrammer ASC
LIMIT 1;
---------------------------------------------------------------------------------------------------------------------------------
##53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?

SELECT 
    pname, salary, prof1, prof2
FROM
    programmer
WHERE
    prof1 NOT IN ('c' , 'oracle', 'dbase')
        AND prof2 NOT IN ('c' , 'oracle', 'dbase')
        AND gender = 'f'
        AND salary > 3000;
---------------------------------------------------------------------------------------------------------------------------------
##54. Which Institute has most number of Students?

SELECT 
    institute, COUNT(pname) AS NumberOfStudent
FROM
    studies
GROUP BY institute
ORDER BY NumberOfStudent DESC
LIMIT 1;
---------------------------------------------------------------------------------------------------------------------------------
##55. What is the Costliest course?

SELECT 
    course, course_fee
FROM
    studies
ORDER BY course_fee DESC
LIMIT 1;
---------------------------------------------------------------------------------------------------------------------------------
##56. Which course has been done by the most of the Students?

SELECT 
    course, COUNT(pname) AS NumberOfStudent
FROM
    studies
GROUP BY course
ORDER BY NumberOfStudent DESC;
---------------------------------------------------------------------------------------------------------------------------------
##57. Which Institute conducts costliest course.

SELECT 
    institute, course, course_fee
FROM
    studies
ORDER BY course_fee DESC
LIMIT 1;
------##OR##--------(by subQueary)------------
SELECT 
    institute, course, course_fee
FROM
    studies
WHERE
    course_fee = (SELECT 
            MAX(course_fee)
        FROM
            studies);
---------------------------------------------------------------------------------------------------------------------------------
##58. Display the name of the Institute and Course, which has below AVG course fee.

SELECT 
    institute, course, course_fee
FROM
    STUDIES
WHERE
    course_fee < (SELECT 
            AVG(course_fee)
        FROM
            STUDIES);
---------------------------------------------------------------------------------------------------------------------------------
##59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,

SELECT 
    course, course_Fee
FROM
    studies
WHERE
    course_fee < (SELECT 
            AVG(course_fee) + 1000
        FROM
            studies)
        AND course_fee > (SELECT 
            AVG(course_fee) - 1000
        FROM
            studies);
---------------------------------------------------------------------------------------------------------------------------------
##60. Which package has the Highest Development cost?

SELECT 
    title, dcost
FROM
    software
WHERE
    dcost = (SELECT 
            MAX(dcost)
        FROM
            software);
----------------------------------------------------------------------------------------------------------------------------------
##61. Which course has below AVG number of Students?
---------------------------------------------------------------------------------------------------------------------------------
##62. Which Package has the lowest selling cost?

SELECT 
    title, scost
FROM
    software
WHERE
    scost = (SELECT 
            MIN(scost)
        FROM
            software);
---------------------------------------------------------------------------------------------------------------------------------
##63. Who Developed the Package that has sold the least number of copies?

SELECT 
    pname, sold
FROM
    software
WHERE
    sold = (SELECT 
            MIN(sold)
        FROM
            software);
---------------------------------------------------------------------------------------------------------------------------------
##64. Which language has used to develop the package, which has the highest sales amount?

SELECT 
    title, developin, (scost) AS salesAmount
FROM
    software
WHERE
    (scost) = (SELECT 
            MAX(scost)
        FROM
            software);
--------------------------------------------------------------------------------------------------------------------------------
##65. How many copies of package that has the least difference between development and selling cost where sold.

SELECT 
    title, dcost, scost, sold, ABS(dcost - scost)
FROM
    software
WHERE
    (dcost - scost) = (SELECT 
            MIN(dcost - scost)
        FROM
            software); 
---------------------------------------------------------------------------------------------------------------------------------
##66. Which is the costliest package developed in PASCAL.

SELECT 
    title, dcost
FROM
    software
WHERE
    dcost = (SELECT 
            MAX(dcost)
        FROM
            software
        WHERE
            developin = 'pascal');
------------------------------------------------------------------------------------------------------------------------------
##67. Which language was used to develop the most number of Packages.

SELECT 
    developin
FROM
    software
GROUP BY developin
HAVING MAX(developin) = (SELECT 
        MAX(developin)
    FROM
        software);
---------------------------------------------------------------------------------------------------------------------------------
##68. Which programmer has developed the highest number of Packages?

SELECT 
    pname
FROM
    software
GROUP BY pname
HAVING MAX(pname) = (SELECT 
        MAX(pname)
    FROM
        software);
---------------------------------------------------------------------------------------------------------------------------------
##69. Who is the Author of the Costliest Package?

SELECT 
    dcost, pname
FROM
    software
WHERE
    dcost = (SELECT 
            MAX(dcost)
        FROM
            software);
---------------------------------------------------------------------------------------------------------------------------------
##70. Display the names of the packages, which have sold less than the AVG number of copies.

SELECT 
    title, sold
FROM
    software
WHERE
    sold < (SELECT 
            AVG(sold)
        FROM
            software); 
---------------------------------------------------------------------------------------------------------------------------------
##71. Who are the authors of the Packages, which have recovered more than double the Development cost?

SELECT 
    PNAME
FROM
    SOFTWARE
WHERE
    SOLD * SCOST > 2 * DCOST;
---------------------------------------------------------------------------------------------------------------------------------
## 72. Display the programmer Name and the cheapest packages developed by them in each language.

select * from
     (select 
         pname, 
         title, 
         dcost, 
         developin,
         (row_number() over (partition by pname order by dcost)) as row1 
             from software) as a 
where a.row1 = 1;
--------------------------------------------------------------------------------------------------------------------------------
##73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.

select * from
     (select 
         pname, 
         developin,
         sold,
         (row_number() over (partition by pname order by sold)) as row1, 
		(row_number() over (partition by pname order by sold desc)) as row2
             from software) as a 
where a.row1 = 1 or a.row2 = 1;
############OR#################33
SELECT 
    pname, developin
FROM
    software
WHERE
    sold IN (SELECT 
            MAX(sold)
        FROM
            software
        GROUP BY pname) 
UNION SELECT 
    pname, developin
FROM
    software
WHERE
    sold IN (SELECT 
            MIN(sold)
        FROM
            software
        GROUP BY pname);
---------------------------------------------------------------------------------------------------------------------------------
##74. Who is the youngest male Programmer born in 1965?

SELECT 
    pname, (dob)
FROM
    programmer
WHERE
    dob = (SELECT 
            MAX(dob)
        FROM
            programmer
        WHERE
            dob LIKE '1965-%' AND gender = 'm');
---------------------------------------------------------------------------------------------------------------------------------
##75. Who is the oldest Female Programmer who joined in 1992?

SELECT 
    pname, doj
FROM
    programmer
WHERE
    doj = (SELECT 
            MIN(doj)
        FROM
            programmer
        WHERE
            doj LIKE '1992-%' AND gender = 'f');
---------------------------------------------------------------------------------------------------------------------------------
##76. In which year was the most number of Programmers born.

SELECT 
    COUNT(pname) AS Counts, YEAR(dob) AS Years
FROM
    programmer
GROUP BY years
ORDER BY counts DESC
LIMIT 1;
---------------------------------------------------------------------------------------------------------------------------------
##77. In which month did most number of programmers join?

SELECT 
    COUNT(DISTINCT (pname)) AS counts,
    MONTHNAME(doj) AS months
FROM
    programmer
GROUP BY months
ORDER BY counts DESC
LIMIT 1;
-----------------------------------------------------------------------------------------------------------------------------
##78. In which language are most of the programmer’s proficient.

select prof1 from programmer group by prof1 having count(prof1) = (select max(count(prof1)) from programmer group by prof1) or count(prof2) = (select max(count(prof2)) from programmer group by prof2)
union
select prof2 from programmer group by Prof2 having count(prof2) = (select max(count(prof1)) from programmer group by prof1) or count(prof2) = (select max(count(prof2)) from programmer group by prof2); 
--------------------------------------------------------------------------------------------------------------------------------
##79. Who are the male programmers earning below the AVG salary of Female Programmers?

SELECT 
    pname, salary
FROM
    programmer
WHERE
    salary < (SELECT 
            AVG(salary)
        FROM
            programmer
        WHERE
            gender = 'f')
        AND gender = 'm';
-------------------------------------------------------------------------------------------------------------------------------
##80.ho are the female programmers earning MORE than the HIGEST paid male programmers?

SELECT 
    pname, salary
FROM
    programmer
WHERE
    salary > (SELECT 
            MAX(salary)
        FROM
            programmer
        WHERE
            gender = 'm')
        AND gender = 'f';
---------------------------------------------------------------------------------------------------------------------------------
##81. Which language has been stated as the proficiency by most of the Programmers?
----------------------------------------------------------------------------------------------------------------------------------
##82. Display the details of those who are drawing the same salary.

SELECT 
    p.pname, p.salary
FROM
    programmer p
        JOIN
    programmer p1 ON p.salary = p1.salary
WHERE
    p.pname <> p1.pname
ORDER BY p.salary;
---------------------------------------------------------------------------------------------------------------------------------
## 83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.

SELECT 
    s.*
FROM
    programmer p,
    software s
WHERE
    p.pname = s.pname AND salary > 3000
        AND gender = 'm';
-------------------------------------------------------------------------------------------------------------------------------------
##84. Display the details of the packages developed in Pascal by the Female Programmers.

SELECT 
    s.*
FROM
    software s
        JOIN
    programmer p ON p.pname = s.pname
WHERE
    gender = 'f' AND developin = 'pascal';
---------------------------------------------------------------------------------------------------------------------------------
##85. Display the details of the Programmers who joined before 1990.

SELECT 
    *, YEAR(doj) AS Years
FROM
    programmer
WHERE
    YEAR(doj) < 1990;
--------------------------------------------------------------------------------------------------------------------------------
##86. Display the details of the Software Developed in C By female programmers of Pragathi.

SELECT 
    s.*, p.gender, st.institute
FROM
    software s
        JOIN
    programmer p ON p.pname = s.pname
        JOIN
    studies st ON st.pname = p.pname
WHERE
    p.gender = 'f' and developin = 'c'
        and st.institute = 'pragathi';
---------------------------------------------------------------------------------------------------------------------------------
##87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.

SELECT 
    s.pname,
    COUNT(s.title) AS NoOfPackage,
    SUM(s.sold) AS NoOfCopies,
    (s.scost * s.sold) AS sales,
    st.institute
FROM
    software s
        JOIN
    studies st ON s.pname = st.pname
GROUP BY s.pname , st.institute;
---------------------------------------------------------------------------------------------------------------------------------
 ##88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
 
select s.* from software s  join programmer p on p.pname=s.pname where s.developin = 'dbase' and p.gender = 'm';
---------------------------------------------------------------------------------------------------------------------------------- 
##89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.

SELECT 
  pname
FROM
    software
where
    ((SELECT 
            p.pname
        FROM
		software s
        JOIN
    programmer p ON p.pname = s.pname
        WHERE
            p.gender = 'm' and YEAR(p.dob) < 1966) or
         (SELECT 
             p.pname
        FROM
            software s
        JOIN
    programmer p ON p.pname = s.pname
        WHERE
            p.gender = 'f' AND YEAR(p.dob) > 1975)) 
order by p.dob, p.gender;

#################################

select s.*,year(dob) from software s join programmer p on p.pname=s.pname where (gender = 'm' and year(dob)<1965) or (gender='f' and year(dob)>1975);
-------------------------------------------------------------------------------------------------------------------------------------
##90. Display the details of the software that has developed in the language which is either the first nor the second proficiency of the programmers.
         
SELECT 
    s.pname, s.developin
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
WHERE
    s.developin NOT IN (p.prof1)
        AND s.developin NOT IN (p.prof2); 
---------------------------------------------------------------------------------------------------------------------------------
##91. Display the details of the software developed by the male students of Sabhari.

SELECT 
    s.*
FROM
    software s
        JOIN
    programmer p ON p.pname = s.pname
        JOIN
    studies st ON p.pname = st.pname
WHERE
    p.gender = 'm'
        AND st.institute = 'sabhari';
---------------------------------------------------------------------------------------------------------------------------------
##92. Display the names of the programmers who have not developed any packages.
 
SELECT 
    *
FROM
    programmer
WHERE
    pname NOT IN (SELECT 
            pname
        FROM
            software);
---------------------------------------------------------------------------------------------------------------------------------
##93. What is the total cost of the Software developed by the programmers of Apple?

SELECT 
    s.pname, SUM(s.scost)
FROM
    software s
        JOIN
    studies st ON s.pname = st.pname
WHERE
    st.institute = 'apple';
---------------------------------------------------------------------------------------------------------------------------------
##94. Who are the programmers who joined on the same day?

SELECT 
    p.pname, p.doj
FROM
    programmer p,  
    programmer pr
WHERE
    p.doj = pr.doj AND p.pname != pr.pname;
    
             #########or##########
             
SELECT 
 pname, doj
FROM
    programmer
WHERE
    doj = ANY (SELECT 
            doj
        FROM
            programmer
        GROUP BY doj
        HAVING COUNT(*) > 1);
---------------------------------------------------------------------------------------------------------------------------------
##95. Who are the programmers who have the same Prof2?

SELECT 
    p.pname, p.prof2
FROM
    programmer p,
    programmer pr
WHERE
    p.prof2 = pr.prof2
        AND p.pname != pr.pname
GROUP BY pname
ORDER BY prof2;
---------------------------------------------------------------------------------------------------------------------------------
##96. Display the total sales value of the software, institute wise.

SELECT 
    st.institute, s.developin, (s.scost * s.sold) AS sales
FROM
    studies st
        JOIN
    software s ON s.pname = st.pname
GROUP BY s.developin , st.institute
ORDER BY st.institute;
---------------------------------------------------------------------------------------------------------------------------------
##97. In which institute does the person who developed the costliest package studied.

SELECT 
    st.institute
FROM
    studies st
        JOIN
    software s ON st.pname = s.pname
WHERE
    MAX(s.dcost) = (SELECT 
            MAX(s.dcost)
        FROM
            software s);
---------------------------------------------------------------------------------------------------------------------------------
##98. Which language listed in prof1, prof2 has not been used to develop any package.
##(when to use union)
SELECT          
    p.prof1, p.prof2
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
WHERE
    p.prof1 NOT IN (s.developin)
        AND p.prof2 NOT IN (s.developin);
     ##############dout##############
SELECT 
    prof1
FROM
    programmer
WHERE
    prof1 NOT IN (SELECT 
            developin
        FROM
            software) 
UNION SELECT 
    prof2
FROM
    programmer
WHERE
    prof2 NOT IN (SELECT 
            developin
        FROM
            software);
---------------------------------------------------------------------------------------------------------------------------------
##99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.

SELECT 
    s.pname, st.course, p.salary
FROM
    software s
        JOIN
    studies st ON s.pname = st.pname
        JOIN
    programmer p ON p.pname = s.pname
WHERE
    s.scost = (select MAX(scost) from software);


--------------------------------------------------------------------------------------------------------------------------------
##100. What is the AVG salary for those whose software sales is more than 50,000/-.

SELECT 
    AVG(p.salary)
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
WHERE
    (s.scost * s.sold) > 50000;
----------------------------------------------------------------------------------------------------------------------------------
##101. How many packages were developed by students, who studied in institute that charge the lowest course fee?

-----------------------------------------------------------------------------------------------------------------------------------
##102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?

SELECT 
    s.pname, s.dcost,count(s.title), st.course
FROM
    software s
        join
	studies st on st.pname=s.pname
WHERE
    s.dcost = (SELECT 
            MIN(dcost)
        FROM
            software);
--------------------------------------------------------------------------------------------------------------------------------
##103. How many packages were developed by the female programmers earning more than the highest paid male programmer?

SELECT 
    p.pname, p.gender, count(s.title)
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
WHERE
    p.gender = 'f'
        AND p.salary > (SELECT 
            MAX(salary)
        FROM
            programmer
        WHERE
            gender = 'm')
group by p.pname;
---------------------------------------------------------------------------------------------------------------------------------
##104. How many packages are developed by the most experienced programmer form BDPS.

SELECT 
    p.pname,
    st.institute,
    COUNT(s.title),
    (DATEDIFF(CURDATE(), p.doj) / 365) AS Experinced
FROM
    programmer p
        JOIN
    studies st ON p.pname = st.pname
        JOIN
    software s ON s.pname = p.pname
WHERE
    st.institute = 'bdps'
GROUP BY p.pname
ORDER BY Experinced DESC
LIMIT 1;
---------------------------------------------------------------------------------------------------------------------------------
##105. List the programmers (form the software table) and the institutes they studied.

SELECT 
    s.pname, st.institute
FROM
    software s
        JOIN
    studies st ON st.pname = s.pname
GROUP BY s.pname;
---------------------------------------------------------------------------------------------------------------------------------
##106
---------------------------------------------------------------------------------------------------------------------------------
##107. List the programmer names (from the programmer table) and No. Of Packages each has developed.

SELECT 
    p.pname, COUNT(s.title)
FROM
    programmer p
        JOIN
    software s ON p.pname = s.pname
GROUP BY p.pname

