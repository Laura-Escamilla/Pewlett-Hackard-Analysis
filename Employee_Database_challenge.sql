-- Deliverable 1 --
--- Retrieve employee number, first name and last name
--- Retrieve title information and date

--- Creating tables for PH-EmployeeDB
--- Filtering the data on the birth date to retrieve the employees who were born between 1952
--- and 1955
SELECT 	emp.emp_no,
		emp.first_name, 
		emp.last_name, 
		ti.title, 
		ti.from_date, 
		ti.to_date	
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as ti
ON (emp.emp_no = ti.emp_no)
	      WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title,
		rt.to_date
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles

--- Retrieve the number of titles from the unique titles and sort the count column in descending order
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles

-- Deliverable 2 --
--- Creating a Mentorship Elegibility table that holds the employees who are eligible to participate in a mentorship program.
--- First retrieve employee number, first name, last name and birth date

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT * FROM mentorship_eligibility

-- Deliverable 3 --
--- Positions to be filled by department and title

SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_titles_dep
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles_dep

SELECT ut.dept_name, ut.title, COUNT(ut.title)
INTO positions_to_fill
FROM (SELECT title, dept_name FROM unique_titles_dep) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.count DESC;

SELECT * FROM positions_to_fill

--- Number of eligible employees for the mentorship program grouped by department

SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.dept_name,
	ti.title
INTO mentorship_eligibility_bydept
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT * FROM mentorship_eligibility_bydept

