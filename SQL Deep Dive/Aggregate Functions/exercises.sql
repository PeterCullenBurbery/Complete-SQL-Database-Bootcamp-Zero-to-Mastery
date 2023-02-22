-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: Employees
 */
-- 


-- Question 1: What is the average salary for the company?
-- Table: Salaries
select avg(salary) as "average salary for the company" from "public"."salaries"
-- $63810.744836143706

-- Question 2: What year was the youngest person born in the company?
-- Table: employees
select min(birth_date) from "public"."employees";
1952-02-01
-- 1952

-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: France
 */
-- 

-- Question 1: How many towns are there in france?
-- Table: Towns
--select count(*) from "public"."towns"
--36684
-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: World
 */
-- 

-- Question 1: How many official languages are there?
-- Table: countrylanguage

-- Question 2: What is the average life expectancy in the world?
-- Table: country

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city


