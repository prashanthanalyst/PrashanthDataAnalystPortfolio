/*Task 1.1
In your company there hasn't been a database table with all the employee information yet.
You need to set up the table called employees in the following way:	
emp_id,first_name,last_name,job_position,salary,start_date,birth_date,store_id,department_id,manager_id
There should be NOT NULL constraints for the following columns:
first_name, last_name, job_position, start_date DATE,  DATE*/
Create Table Employee_table(emp_id Serial primary key,first_name varchar(25) Not Null,last_name varchar(25) Not Null,
job_position varchar(25) Not Null,salary decimal(8,2),start_date date not null,
birth_date date not null, store_id int,department_id int, 
							.
							int)

Task 1.2
/*Set up an additional table called departments in the following columns:
department_id, department,division), Additionally no column should allow nulls.*/
create table departments(department_id serial primary key, department varchar(25) not null, division varchar(25) not null)

Task 2
/*Alter the employees table in the following way:
- Set the column department_id to not null.
- Add a default value of CURRENT_DATE to the column start_date.
- Add the column end_date with an appropriate data type (one that you think makes sense).
- Add a constraint called birth_check that doesn't allow birth dates that are in the future.
- Rename the column job_position to position_title.*/
alter table Employee_table alter column  department_id set not null,
alter column start_date set default CURRENT_DATE,
add column end_date date,
add constraint birth_date check (birth_date<CURRENT_DATE)
alter table Employee_table Rename column job_position to position_title
select * from Employee_table

/*Insert the following values into the employees table.
There will be most likely an error when you try to insert the values.
So, try to insert the values and then fix the error.
Columns:
(emp_id,first_name,last_name,position_title,salary,start_date,birth_date,store_id,department_id,manager_id,end_date)
Values:
(1,'Morrie','Conaboy','CTO',21268.94,'2005-04-30','1983-07-10',1,1,NULL,NULL),
(2,'Miller','McQuarter','Head of BI',14614.00,'2019-07-23','1978-11-09',1,1,1,NULL),
(3,'Christalle','McKenny','Head of Sales',12587.00,'1999-02-05','1973-01-09',2,3,1,NULL),
(4,'Sumner','Seares','SQL Analyst',9515.00,'2006-05-31','1976-08-03',2,1,6,NULL),
(5,'Romain','Hacard','BI Consultant',7107.00,'2012-09-24','1984-07-14',1,1,6,NULL),
(6,'Ely','Luscombe','Team Lead Analytics',12564.00,'2002-06-12','1974-08-01',1,1,2,NULL),
(7,'Clywd','Filyashin','Senior SQL Analyst',10510.00,'2010-04-05','1989-07-23',2,1,2,NULL),
(8,'Christopher','Blague','SQL Analyst',9428.00,'2007-09-30','1990-12-07',2,2,6,NULL),
(9,'Roddie','Izen','Software Engineer',4937.00,'2019-03-22','2008-08-30',1,4,6,NULL),
(10,'Ammamaria','Izhak','Customer Support',2355.00,'2005-03-17','1974-07-27',2,5,3,2013-04-14),
(11,'Carlyn','Stripp','Customer Support',3060.00,'2013-09-06','1981-09-05',1,5,3,NULL),
(12,'Reuben','McRorie','Software Engineer',7119.00,'1995-12-31','1958-08-15',1,5,6,NULL),
(13,'Gates','Raison','Marketing Specialist',3910.00,'2013-07-18','1986-06-24',1,3,3,NULL),
(14,'Jordanna','Raitt','Marketing Specialist',5844.00,'2011-10-23','1993-03-16',2,3,3,NULL),
(15,'Guendolen','Motton','BI Consultant',8330.00,'2011-01-10','1980-10-22',2,3,6,NULL),
(16,'Doria','Turbat','Senior SQL Analyst',9278.00,'2010-08-15','1983-01-11',1,1,6,NULL),
(17,'Cort','Bewlie','Project Manager',5463.00,'2013-05-26','1986-10-05',1,5,3,NULL),
(18,'Margarita','Eaden','SQL Analyst',5977.00,'2014-09-24','1978-10-08',2,1,6,2020-03-16),
(19,'Hetty','Kingaby','SQL Analyst',7541.00,'2009-08-17','1999-04-25',1,2,6,'NULL'),
(20,'Lief','Robardley','SQL Analyst',8981.00,'2002-10-23','1971-01-25',2,3,6,2016-07-01),
(21,'Zaneta','Carlozzi','Working Student',1525.00,'2006-08-29','1995-04-16',1,3,6,2012-02-19),
(22,'Giana','Matz','Working Student',1036.00,'2016-03-18','1987-09-25',1,3,6,NULL),
(23,'Hamil','Evershed','Web Developper',3088.00,'2022-02-03','2012-03-30',1,4,2,NULL),
(24,'Lowe','Diamant','Web Developper',6418.00,'2018-12-31','2002-09-07',1,4,2,NULL),
(25,'Jack','Franklin','SQL Analyst',6771.00,'2013-05-18','2005-10-04',1,2,2,NULL),
(26,'Jessica','Brown','SQL Analyst',8566.00,'2003-10-23','1965-01-29',1,1,2,NULL)*/

INSERT INTO Employee_table
VALUES
(1,'Morrie','Conaboy','CTO',21268.94,'2005-04-30','1983-07-10',1,1,NULL,NULL),
(2,'Miller','McQuarter','Head of BI',14614.00,'2019-07-23','1978-11-09',1,1,1,NULL),
(3,'Christalle','McKenny','Head of Sales',12587.00,'1999-02-05','1973-01-09',2,3,1,NULL),
(4,'Sumner','Seares','SQL Analyst',9515.00,'2006-05-31','1976-08-03',2,1,6,NULL),
(5,'Romain','Hacard','BI Consultant',7107.00,'2012-09-24','1984-07-14',1,1,6,NULL),
(6,'Ely','Luscombe','Team Lead Analytics',12564.00,'2002-06-12','1974-08-01',1,1,2,NULL),
(7,'Clywd','Filyashin','Senior SQL Analyst',10510.00,'2010-04-05','1989-07-23',2,1,2,NULL),
(8,'Christopher','Blague','SQL Analyst',9428.00,'2007-09-30','1990-12-07',2,2,6,NULL),
(9,'Roddie','Izen','Software Engineer',4937.00,'2019-03-22','2008-08-30',1,4,6,NULL),
(10,'Ammamaria','Izhak','Customer Support',2355.00,'2005-03-17','1974-07-27',2,5,3,'2013-04-14'),
(11,'Carlyn','Stripp','Customer Support',3060.00,'2013-09-06','1981-09-05',1,5,3,NULL),
(12,'Reuben','McRorie','Software Engineer',7119.00,'1995-12-31','1958-08-15',1,5,6,NULL),
(13,'Gates','Raison','Marketing Specialist',3910.00,'2013-07-18','1986-06-24',1,3,3,NULL),
(14,'Jordanna','Raitt','Marketing Specialist',5844.00,'2011-10-23','1993-03-16',2,3,3,NULL),
(15,'Guendolen','Motton','BI Consultant',8330.00,'2011-01-10','1980-10-22',2,3,6,NULL),
(16,'Doria','Turbat','Senior SQL Analyst',9278.00,'2010-08-15','1983-01-11',1,1,6,NULL),
(17,'Cort','Bewlie','Project Manager',5463.00,'2013-05-26','1986-10-05',1,5,3,NULL),
(18,'Margarita','Eaden','SQL Analyst',5977.00,'2014-09-24','1978-10-08',2,1,6,'2020-03-16'),
(19,'Hetty','Kingaby','SQL Analyst',7541.00,'2009-08-17','1999-04-25',1,2,6,NULL),
(20,'Lief','Robardley','SQL Analyst',8981.00,'2002-10-23','1971-01-25',2,3,6,'2016-07-01'),
(21,'Zaneta','Carlozzi','Working Student',1525.00,'2006-08-29','1995-04-16',1,3,6,'2012-02-19'),
(22,'Giana','Matz','Working Student',1036.00,'2016-03-18','1987-09-25',1,3,6,NULL),
(23,'Hamil','Evershed','Web Developper',3088.00,'2022-02-03','2012-03-30',1,4,2,NULL),
(24,'Lowe','Diamant','Web Developper',6418.00,'2018-12-31','2002-09-07',1,4,2,NULL),
(25,'Jack','Franklin','SQL Analyst',6771.00,'2013-05-18','2005-10-04',1,2,2,NULL),
(26,'Jessica','Brown','SQL Analyst',8566.00,'2003-10-23','1965-01-29',1,1,2,NULL);

Task 3.2
--Insert values into the departments table.
insert into departments values(1,'Analyst','IT'),(2,'Finance','Administration'),
(3,'Sales','Sales'), (4,'Website','IT'),(5,'Back Office','Administration')

Task 4
--Jack Franklin gets promoted to 'Senior SQL Analyst' and the salary raises to 7200.
Update the values accordingly.
select * from Employee_table where first_name = 'Jack' and last_name ='Franklin'
Update Employee_table set position_title = 'Senior SQL Analyst' where first_name = 'Jack' and last_name ='Franklin'
Update Employee_table set salary = 7200 where first_name = 'Jack' and last_name ='Franklin'

Task 4.2
/*The responsible people decided to rename the position_title Customer Support to Customer Specialist.
Update the values accordingly.*/
Update Employee_table set position_title = 'Customer Specialist' where position_title = 'Customer Support'

Task 4.3
/*All SQL Analysts including Senior SQL Analysts get a raise of 6%.
Upate the salaries accordingly.*/
Update Employee_table set salary= salary* 1.06 where position_title like '%SQL Analyst%'

Task 4.4
--Question: What is the average salary of a SQL Analyst in the company (excluding Senior SQL Analyst)?
select round(avg(salary),2) from  Employee_table where position_title = 'SQL Analyst'
--Answer:9364.83

Task 5.1

/*Write a query that adds a column called manager that contains  first_name and last_name (in one column) in the data output.
Secondly, add a column called is_active with 'false' if the employee has left the company already, otherwise the value is 'true'.*/
select emp.*, case when emp.end_date is null then 'True' else 'false' end is_active, mng.first_name ||''|| mng.last_name manager_name
from Employee_table emp join Employee_table mng on emp.emp_id=mng.emp_id

Task 5.2
--Create a view called v_employees_info from that previous query.
Create view v_employees_info as  (select emp.*, case when emp.end_date is null then 'True' else 'false' end is_active, mng.first_name ||''|| mng.last_name manager_name
from Employee_table emp join Employee_table mng on emp.emp_id=mng.emp_id) 

Task 6
/*
Write a query that returns the average salaries for each positions with appropriate roundings.*/
select position_title, round(avg(salary),2) avg_salary 
from v_employees_info group by position_title order by avg_salary

Question:
--What is the average salary for a Software Engineer in the company.
select position_title, round(avg(salary),2) avg_salary from v_employees_info 
where position_title ='Software Engineer' group by position_title 
--Answer: 6028.00

Task 7
--Write a query that returns the average salaries per division.
select division, round(avg(salary),2) from v_employees_info EI join departments d on 
EI.department_id=d.department_id group by division
select * from  departments

Question:
--What is the average salary in the Sales department?
select division, round(avg(salary),2) avg_salary from v_employees_info 
EI join departments d on EI.department_id=d.department_id
where division ='Sales' group by division 
--Answer: 6189.01

Task 8.1
/*-Write a query that returns the following:
emp_id, first_name, last_name, position_title, salary and a column that returns
the average salary for every position_title. Order the results by the emp_id.*/
select emp_id, first_name, last_name, position_title, salary, round(avg(salary) over(partition by position_title),2) from 
Employee_table order by emp_id

Task 8.2
/*How many people earn less than there avg_position_salary?
Write a query that answers that question.
Ideally, the output just shows that number directly.*/
select count(*) from (select emp_id, first_name, last_name, position_title, salary,
round(avg(salary) over(partition by position_title) ,2)as avg_salary  from 
Employee_table) as a where salary < avg_salary
--Answer: 9

Task 9:

/*Write a query that returns a running total of the salary development by the start_date.
In your calculation, you can assume their salary has not changed over time, and 
you can disregard the fact that people have left the company
(write the query as if they were still working for the company).*/
select emp_id, salary,start_date,  sum(salary) over(order by start_date) from Employee_table

Question:
--What was the total salary after 2018-12-31?
select sum(salary) from Employee_table
where start_date>'2018-12-31'
Answer: 22639.00

Task 10:
--Create the same running total but now also consider the fact that people were leaving the company.
SELECT start_date, SUM(salary) OVER(ORDER BY start_date) FROM 
(SELECT emp_id, salary, start_date FROM Employee_table UNION SELECT emp_id, -salary, end_date 
FROM v_employees_info WHERE is_active ='false' ORDER BY start_date) a

Question:
--What was the total salary after 2018-12-31?
SELECT SUM(salary)  FROM 
(SELECT emp_id, salary, start_date FROM Employee_table UNION SELECT emp_id, -salary, end_date 
FROM v_employees_info WHERE is_active ='false' ORDER BY start_date) a WHERE start_date>'2018-12-31'
Answer: 15923.24

Task 11
--Write a query that outputs only the top earner per position_title including first_name and position_title and their salary.
SELECT first_name, position_title, salary FROM Employee_table e1 
WHERE salary = (SELECT MAX(salary) FROM Employee_table e2 
WHERE e1.position_title=e2.position_title)

Question:
--What is the top earner with the position_title SQL Analyst?
SELECT first_name, position_title, salary FROM Employee_table e1 where position_title = 'SQL Analyst' and
salary = (SELECT MAX(salary) FROM Employee_table e2 
WHERE e1.position_title=e2.position_title) 
Answer: Sumner with 10085.90

Task 11.2
--Add also the average salary per position_title.
SELECT first_name, position_title, salary, (select round(avg(salary),2) from Employee_table e3 where e3.position_title=e1.position_title) avg_salary FROM Employee_table e1
where salary = (SELECT MAX(salary) FROM Employee_table e2 
WHERE e1.position_title=e2.position_title) 

Task 11.3
/*Remove those employees from the output of the previous query that has the same salary as the average of their position_title.
These are the people that are the only ones with their position_title.*/
SELECT first_name, position_title, salary, (select round(avg(salary),2) from Employee_table e3 where e3.position_title=e1.position_title) avg_salary FROM Employee_table e1
where salary = (SELECT MAX(salary) FROM Employee_table e2 
WHERE e1.position_title=e2.position_title) AND salary!=(SELECT ROUND(AVG(salary),2) as avg_in_pos FROM Employee_table e3
WHERE e1.position_title=e3.position_title)


Task 12
/*Write a query that returns all meaningful aggregations of - sum of salary, - number of employees,
- average salary grouped by all meaningful combinations of - division, - department, - position_title. 
Consider the levels of hierarchies in a meaningful way.*/
SELECT division, department, position_title, SUM(salary), COUNT(*), ROUND(AVG(salary),2) 
FROM Employee_table NATURAL JOIN departments GROUP BY
ROLLUP( division, department, position_title ) ORDER BY 1,2,3

Task 13
/*Write a query that returns all employees (emp_id) including their position_title, 
department, their salary, and the rank of that salary partitioned by department. 
The highest salary per division should have rank 1.*/
SELECT emp_id, position_title, department, salary, 
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM Employee_table NATURAL LEFT JOIN departments

Question:
--Which employee (emp_id) is in rank 7 in the department Analytics?
SELECT emp_id
FROM (select emp_id, position_title, department, salary, 
RANK() OVER(PARTITION BY department order by salary desc ) rank 
from Employee_table Natural LEFT JOIN departments) a where rank=7 and department = 'Analyst'
--Answer:emp_id 26

Task 14
--Write a query that returns only the top earner of each department including
their emp_id, position_title, department, and their salary.*/*/
SELECT * FROM ( SELECT emp_id, position_title, department, salary, 
RANK() OVER(PARTITION BY department ORDER BY salary DESC) 
FROM Employee_table NATURAL LEFT JOIN departments) a WHERE rank=1

Question:
--Which employee (emp_id) is the top earner in the department Finance?
SELECT emp_id FROM ( SELECT emp_id, position_title, department, salary, 
RANK() OVER(PARTITION BY department ORDER BY salary DESC) 
FROM Employee_table NATURAL LEFT JOIN departments) a WHERE rank=1 and department='Finance'
--Answer: emp_id 8

