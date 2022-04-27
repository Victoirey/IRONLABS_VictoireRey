use employees_mod;
select * from t_departments;
select * from t_dept_manager;
select * from t_dept_emp;
select * from t_employees;
select * from t_salaries;


SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
		JOIN 
	t_employees ee ON dm.emp_no = ee.emp_no
having calendar_year>=1990
ORDER BY dm.emp_no, calendar_year;



select start.Beg_year, start.gender, start.Nbstarts, coalesce(end.Nbends, 0) as Nbends, coalesce(Nbstarts-Nbends, Nbstarts, -Nbends) as Var, start.dept_name
from  
(select year(m.from_date) as Beg_year, count(*) as Nbstarts, e.gender, d.dept_name
from t_employees e
join t_dept_manager m on e.emp_no=m.emp_no
join t_departments d on m.dept_no=d.dept_no
group by Beg_year, gender) start
left join (
select year(m.to_date) as End_year, count(*) as Nbends, e.gender
from t_employees e
join t_dept_manager m on e.emp_no=m.emp_no
group by End_year, gender) end
on start.Beg_year=end.End_year and start.gender=end.gender
order by start.Beg_year, start.gender;



select e.emp_no as NbManagers, e.gender, if(e.hire_date<m.from_date, year(m.from_date), year(hire_date)) as Beg, if(m.to_date<> "999-01-01", year(m.to_date), "current")
from t_employees e
join t_dept_manager m
on e.emp_no=m.emp_no
join t_departments d
on m.dept_no=d.dept_no
group by e.emp_no;