--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.

SELECT * FROM employees
WHERE DATE_PART('year', hire_date) = '1986';

--3. List the manager of each department with the following information: department number, department name,  the manager's employee number, last name, first name, and start and end employment dates.

SELECT
	departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date,
	employees.first_name,
	employees.last_name
FROM 
	departments, dept_manager, employees
WHERE 
	employees.emp_no = dept_manager.emp_no AND departments.dept_no = dept_manager.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees, departments, dept_emp
WHERE
	employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM 
	employees
WHERE
	first_name = 'Hercules' AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM
	employees,
	departments,
	dept_emp
WHERE
	departments.dept_no = 'd007' AND employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM
	employees,
	departments,
	dept_emp
WHERE
	(departments.dept_no = 'd007' OR departments.dept_no = 'd005')
	AND employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no 
ORDER BY 
	dept_name;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT  
	employees.last_name,
	COUNT(employees.last_name) as count_employee
FROM
	employees
GROUP BY 
	employees.last_name
ORDER BY 
	count_employee DESC;
