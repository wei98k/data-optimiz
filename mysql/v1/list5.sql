# 求人数最多的那个部门的部门名称
select
	deps.dept_name, deps.dept_no, count(detp.emp_no) as hr_count
from
	departments as deps
left join 
	dept_emp as detp
on
	deps.dept_no = detp.dept_no
group by deps.dept_no having max(hr_count)
order by hr_count desc 
limit 1;