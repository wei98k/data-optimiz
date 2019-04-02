# 统计各部门曾经拥有的员工数量
select 
	emp_no,
	dept_no,
	from_date,
	to_date,
	count(*) dept_num
from
	dept_emp 
where
	to_date < str_to_date('9999', '%Y-%m-%d') 
group by dept_no;

# 统计各部门曾经到现在拥有的员工数量
select 
	emp_no,
	dept_no,
	from_date,
	to_date,
	count(*) dept_num
from
	dept_emp 
group by dept_no;

# 统计各部门现在拥有的员工数量
select 
	emp_no,
	dept_no,
	from_date,
	to_date,
	count(*) dept_num
from
	dept_emp
where
	to_date >= str_to_date('9999', '%Y-%m-%d') 
group by dept_no;