--create a table and view column datatypes
DROP TABLE departments;

CREATE TABLE departments(
	dept_no VARCHAR primary key,
	dept_name VARCHAR);

SELECT *
FROM departments;

CREATE TABLE titles(
	title_id VARCHAR primary key,
	title VARCHAR);

SELECT * FROM titles;

CREATE TABLE employees(
	emp_no INTEGER primary key,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));
	
SELECT * FROM employees;

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INTEGER, 
	primary key (dept_no,emp_no));
	
ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) references departments(dept_no);
ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) references employees (emp_no);

CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no, dept_no));
	
ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) references departments(dept_no);
ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) references employees (emp_no);	
		

CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER);
	
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1/1/1986' and '12/31/1986';

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no;

SELECT dept_emp.emp_no, departments.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_emp 
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

	


