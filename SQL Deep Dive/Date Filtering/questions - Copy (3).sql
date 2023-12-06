/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT * FROM employees;
 select *,age(birth_date) from employees limit 7;
 select *,age(birth_date),extract (year from age(birth_date)) from employees limit 7;
 select *,age(birth_date),extract (year from age(birth_date)),extract (year from age(birth_date))>60 from employees limit 7;
  select */*we are finding all employees that are 60 years or older.*/,age(birth_date),extract (year from age(birth_date)),extract (year from age(birth_date))>60 from employees limit 7;
   select * from employees where extract (year from age(birth_date))>60 limit 7;
   select count(*) as "number of employees that are 60 years or older" from employees where extract (year from age(birth_date))>60;
/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/
/*This returns results. I am using a compound table expression (CTE).*/
SELECT * FROM employees;
with table1 as (SELECT *,trim(to_char(hire_date,'MONTH')) as "hire_month" FROM employees) select * from table1;
/*This seems like it should return something but it doesn't because the month is 'February ' with a space and whitespace not just 'February'.*/
with table1 as (SELECT *,trim(to_char(hire_date,'MONTH')) as "hire_month" FROM employees) select * from table1 where "hire_month" like 'February';
/*Adding a % sign works to catch the white space.*/
with table1 as (SELECT *,trim(to_char(hire_date,'MONTH')) as "hire_month" FROM employees) select * from table1 where "hire_month" like 'February%';
/*Another solution is to use trim to remove whitespace at the beginning and ending.*/
with table1 as (SELECT *,trim(to_char(hire_date,'MONTH')) as "hire_month" FROM employees) select * from table1 where "hire_month" ilike 'February';
/*This query tells us there are 24 448 employees hired in February.*/
with table1 as (SELECT *,trim(to_char(hire_date,'Month')) as "hire_month" FROM employees) select count(*) from table1 where "hire_month" ilike 'February';
/*Here I made an alias to make it easier to understand.*/
with table1 as (SELECT *,trim(to_char(hire_date,'Month')) as "hire_month" FROM employees) select count(*) as "number of employees that were hired in February" from table1 where "hire_month" ilike 'February';
/*Another approach involves in getting a value of February to match against.*/
select to_char(date 'February 1,2023','MM');
/*We cast it as an integer.*/
select to_char(date 'February 1,2023','MM')::int;
/*It can be helpful to limit the size of the output in psql command line where the table display is not as good as a GUI like pg admin. I chose 7 because e^3~7.*/
 select extract(month from hire_date) from employees limit 7;
/*Here is my alternative approach without a limit.*/
 SELECT * from employees where extract (month from hire_date)=(select to_char(date 'February 1,2023','MM')::int);
 /*Here is my alternative approach with a limit of 7.*/
  SELECT * from employees where extract (month from hire_date)=(select to_char(date 'February 1,2023','MM')::int) limit 7;
  /*Here I count the employees and get 24 448 as before.*/
   SELECT count(*) from employees where extract (month from hire_date)=(select to_char(date 'February 1,2023','MM')::int) limit 7;
   /*it doesn't really make sense to have limit with count(*)*/
     SELECT count(*) from employees where extract (month from hire_date)=(select to_char(date 'February 1,2023','MM')::int);
/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT * FROM employees;
SELECT count(*) from employees where extract (month from birth_date)=(select to_char(date 'November 1,2023','MM')::int);
SELECT
	count(*)
FROM
	employees
WHERE
	extract (
		month
		FROM
			birth_date
	) = (
		
		SELECT
			to_char(date 'November 1,2023', 'MM'):: INT
	)
LIMIT
	7;
	
	SELECT count(*) as "number of employees born in November" from employees where extract (month from birth_date)=(select to_char(date 'November 1,2023','MM')::int) limit 7;
/* There were 24.5k employees born in November.*/
/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT * FROM employees;
select * from employees order by age(birth_date) desc limit 7;
/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT * FROM orders;
 select count(*) as "number of orders made in January 2004" from orders where extract (month from orderdate)=(select to_char(date 'January 1, 2004','MM')::int) and extract (year from orderdate)=2004;

