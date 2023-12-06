/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT * FROM employees;

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT count(*) FROM employees where to_char(hire_date,'Month') ilike 'February';

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT count(*) FROM employees where to_char(birth_date,'Month') ilike 'November';

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT max(age(birth_date)) FROM employees;
select *,age(birth_date) as "age" from employees order by age desc,last_name asc,first_name asc,emp_no asc limit 1;
/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT * FROM orders where ;

