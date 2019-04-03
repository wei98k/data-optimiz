# 按工资降序排序, 若工资相同, 按入职日期升序排序. 
select 
	sals.emp_no, sals.salary, sals.from_date, sals.to_date, emps.hire_date
from
	salaries as sals
left join
	employees as emps
on sals.emp_no = emps.emp_no
order by sals.salary desc, emps.hire_date asc

## 测试语句 找出工资相同记录的数据
select 
	sals.emp_no, sals.salary, sals.from_date, sals.to_date, emps.hire_date, count(sals.salary) as hr_count
from
	salaries as sals
left join
	employees as emps
on sals.emp_no = emps.emp_no
group by sals.salary having hr_count > 2
order by sals.salary desc 

## 测试语句 39346 有5条相同记录
select 
	sals.emp_no, sals.salary, sals.from_date, sals.to_date, emps.hire_date
from
	salaries as sals
left join
	employees as emps
on sals.emp_no = emps.emp_no
where sals.salary = 39346
order by sals.salary desc

