# 查找名字以字母K开头，以i结尾，并且第三个字母为o的雇员名字(First_name)、职位和所在部门号
select 
	concat(e.first_name, ' ', e.last_name) as username,
	d.dept_no,
	t.title
from
	employees as e
left join
	dept_emp as d
on e.emp_no = d.emp_no
left join
	titles as t
on e.emp_no = t.emp_no
where
	e.first_name like 'K_o%i'