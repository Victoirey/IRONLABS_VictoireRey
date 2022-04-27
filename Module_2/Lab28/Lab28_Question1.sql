use employees_mod;
select * from t_departments;
select * from t_dept_manager;
select * from t_dept_emp;
select * from t_employees;
select * from t_salaries;

# Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990.

select gender, year(hire_date) as year, count(emp_no) 
from t_employees
group by year, gender;




