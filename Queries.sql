-- Query 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no=s.emp_no;

-- Query 2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date >= '1986-01-01' 
AND hire_date <= '1986-12-31';

-- Query 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
SELECT 
	a.dept_no department_number,
	b.dept_name department_name,
	a.emp_no employee_number,
	last_name,
	first_name,
	from_date start_date,
	to_date end_date
FROM dept_manager AS a
INNER JOIN departments AS b
ON a.dept_no=b.dept_no
INNER JOIN employees AS c
ON a.emp_no=c.emp_no;
	
-- Query 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT 
	a.emp_no employee_number,
	last_name,
	first_name,
	dept_name department_name
FROM employees AS a
INNER JOIN dept_manager AS b
ON a.emp_no = b.emp_no
INNER JOIN departments AS c
ON b.dept_no = c.dept_no;

-- Query 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Query 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name
SELECT
	a.emp_no employee_number,
	last_name,
	first_name,
	dept_name department_name
FROM employees AS a
INNER JOIN dept_manager AS b
ON a.emp_no=b.emp_no
INNER JOIN departments AS c
ON b.dept_no=c.dept_no
WHERE dept_name = 'Sales';

-- Query 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT
	a.emp_no employee_number,
	last_name,
	first_name,
	dept_name department_name
FROM employees AS a
INNER JOIN dept_manager AS b
ON a.emp_no=b.emp_no
INNER JOIN departments AS c
ON b.dept_no=c.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- Query 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) employees_count FROM employees
GROUP BY last_name
ORDER BY employees_count DESC;