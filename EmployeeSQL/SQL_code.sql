-- Create Departments table
CREATE TABLE Departments (
  dept_no CHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no)
);

-- Create Dept_emp table
CREATE TABLE Dept_emp (
  emp_no INT NOT NULL,
  dept_no CHAR(4) NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

-- Create Titles table
CREATE TABLE Titles (
  title_id VARCHAR(50) NOT NULL,
  title VARCHAR(50) NOT NULL,
  PRIMARY KEY (title_id)
);

-- Create Employees table
CREATE TABLE Employees (
  emp_no INT NOT NULL,
  emp_title_id VARCHAR(50) NOT NULL,
  birth_date VARCHAR NOT NULL,
  first_name VARCHAR(14) NOT NULL,
  last_name VARCHAR(16) NOT NULL,
  sex CHAR(1) NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);


-- Create Dept_manager table
CREATE TABLE Dept_manager (
  dept_no CHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

-- Create Salaries table
CREATE TABLE Salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  PRIMARY KEY (emp_no, salary),
  FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

select * from employees

select emp_no from employees

---Data Analysis 1
SELECT Employees.emp_no, last_name, first_name, sex, salary
FROM Employees
JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

---Data Analysis 2
SELECT first_name, last_name, hire_date
FROM Employees
WHERE date_part('year', hire_date) = 1986;

---Data Analysis 3
SELECT departments.dept_no, dept_name, Employees.emp_no, last_name, first_name
FROM Departments
JOIN Dept_manager ON Departments.dept_no = Dept_manager.dept_no
JOIN Employees ON Employees.emp_no = Dept_manager.emp_no;

---Data Analysis 4
SELECT departments.dept_no, Employees.emp_no, last_name, first_name, dept_name
FROM Employees
JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
JOIN Departments ON Departments.dept_no = Dept_emp.dept_no;

---Data Analysis 5
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

---Data Analysis 6
SELECT Employees.emp_no, last_name, first_name
FROM Employees
JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
JOIN Departments ON Departments.dept_no = Dept_emp.dept_no
WHERE dept_name = 'Sales';

---Data Analysis 7
SELECT Employees.emp_no, last_name, first_name, dept_name
FROM Employees
JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
JOIN Departments ON Departments.dept_no = Dept_emp.dept_no
WHERE dept_name IN ('Sales', 'Development');

---Data Analysis 8
SELECT last_name, COUNT(*) as frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;








