-- Create a Retirement Titles table 
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rtt.emp_no) rtt.emp_no,
	rtt.first_name,
	rtt.last_name,
	rtt.title
INTO unique_titles
FROM retirement_titles AS rtt
ORDER BY rtt.emp_no, rtt.to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (uqt.emp_no),uqt.title
INTO retiring_titles 
FROM unique_titles AS uqt
GROUP BY uqt.title
ORDER BY COUNT (uqt.emp_no) DESC;

-- Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY (e.emp_no)


SELECT * FROM retirement_titles;

SELECT * FROM unique_titles;

SELECT * FROM retiring_titles; 

SELECT * FROM mentorship_eligibility;