/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT * FROM employees,age(birth_date) as "age" where age(birth_date)>interval '60 years' order by "age" desc;

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT * FROM employees;
SELECT *,to_char(hire_date,'MONTH'),(to_char(hire_date,'MONTH))::text like 'February' FROM employees;
SELECT * FROM employees where to_char(hire_date,'MONTH') ILIKE 'February';

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT * FROM employees;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT * FROM employees;

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT * FROM orders;

