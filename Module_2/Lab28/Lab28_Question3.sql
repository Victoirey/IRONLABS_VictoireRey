use employees_mod;
select * from t_departments;
select * from t_dept_manager;
select * from t_dept_emp;
select * from t_employees;
select * from t_salaries;

#Compare the average salary of female versus male employees in the entire company until year 2002, 
# and add a filter allowing you to see that per each department.

select year(e.hire_date) as year, avg(s.salary) as Avg_salary, e.gender, d.dept_name
from t_employees e
join t_salaries s
on e.emp_no=s.emp_no
CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
		JOIN 
	t_dept_emp de ON de.dept_no = d.dept_no
group by year, gender;

left join t_dept_emp de
on de.emp_no=e.emp_no
left join t_dept_manager dm
on dm.emp_no=e.emp_no
left join t_departments d
on d.dept_no=de.dept_no
