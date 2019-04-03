# 求每个部门薪水的最大值, 降序排序, 取前三名
select
	deps.dept_name, detp.emp_no, max(sals.salary)
from
	departments as deps
left join
	dept_emp as detp
on deps.dept_no = detp.dept_no
left join
	salaries as sals
on detp.emp_no = sals.emp_no
group by deps.dept_no
order by max(sals.salary) desc
limit 3

## 如果是每个部门中的前3名呢? 