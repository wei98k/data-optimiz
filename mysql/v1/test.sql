select de.emp_no,de.dept_no,dep.dept_name,emp.first_name, emp.last_name, emp.hire_date,sle.salary from  employees  as  emp
				left join dept_emp as de on de.emp_no = emp.emp_no
				left join departments as dep  on dep.dept_no = de.dept_no
				left join salaries as sle on de.emp_no = sle.emp_no;

select de.emp_no,de.dept_no,dep.dept_name,emp.first_name, emp.last_name, emp.hire_date,sle.salary from dept_emp as de 
				left join departments as dep on de.dept_no = dep.dept_no
				left join employees as emp  on de.emp_no = emp.emp_no
				left join salaries as sle on de.emp_no = sle.emp_no;

select emp.emp_no, emp.first_name, emp.last_name, group_concat(dep.dept_name) from employees as emp
				left join dept_emp as dept on emp.emp_no = dept.emp_no
				left join departments as dep on dept.dept_no = dep.dept_no
				group by emp.emp_no;
# 共 331603
# 共 300024

# group by emp.emp_no;
select dept.emp_no, dep.dept_no, dep.dept_name, max(sal.salary) from departments as dep
	left join dept_emp as dept on dept.dept_no = dep.dept_no
	left join employees as emp on dept.emp_no = emp.emp_no
  left join salaries as sal on sal.emp_no = emp.emp_no
	group by dep.dept_name; # 最大额-144866

select dept.emp_no, max(sal.salary), dept.dept_no from dept_emp as dept
	left join salaries as sal on sal.emp_no = dept.emp_no
	where dept.dept_no = 'd009'; # 条数-223644 最大额-144866

# validate  Customer Service   max 144866  10011 

select emp.emp_no, dept.dept_no from employees as emp
	left join dept_emp as dept on dept.emp_no = emp.emp_no
	where dept.dept_no = 'd009'; # 23580

select count(emp_no) from dept_emp where dept_no = 'd009'; # 23580

#  每月平均 (75286 * 6 + 75994 * 6 ) / 12 1994年中平均值 451716 + 455964 907680 / 12 = 75640

select emp_no, salary, from_date, to_date from salaries 
	where
		from_date >= '1994-00-00' and
		from_date <= '1995-00-00' and
		emp_no = '10001';

select emp_no, salary, from_date, to_date from salaries 
	where
		to_date >= '1994-00-00' and
		to_date <= '1995-00-00' and
		emp_no = '10001';



select emp_no, salary, from_date, to_date from salaries where emp_no = '10001';


select e.emp_no,concat(e.first_name," ",e.last_name) name,e.gender,s.salary,t.title from employees e,salaries s,titles t where e.emp_no = s.emp_no and e.emp_no = t.emp_no and s.from_date > str_to_date('1986-06-26','%Y-%m-%d') and s.to_date < str_to_date('1987-06-2 25','%Y-%m-%d') limit 10;

select str_to_date('1986','%Y-%m-%d')

select 1996

select NOW();

# 35316 共6年数据
select count(*) as people, YEAR(hire_date) as entry_date from employees group by YEAR(hire_date) order by entry_date desc;

select hire_date from employees where hire_date >= str_to_date('2000', '%Y-%m-%d') and hire_date < str_to_date('2001', '%Y-%m-%d')

select count(*) as people, YEAR(hire_date) as entry_date from employees where hire_date > str_to_date('1992', '%Y-%m-%d') and hire_date <= str_to_date('1997', '%Y-%m-%d')  group by YEAR(hire_date) order by entry_date desc;

select emp_no, count(*) as c from dept_emp group by emp_no having c > 1;

select emp_no, dept_no, from_date, to_date  from dept_emp where emp_no = '10010'

# 统计出1996年期间任职的员工 1995-10-12 到 2001-01-12 那么这个员工在 1996年也在该部门

select emp_no, dept_no, from_date, to_date, count(*) dept_num from dept_emp where from_date <= str_to_date('1996', '%Y-%m-%d') and to_date >= str_to_date('1996', '%Y-%m-%d') GROUP BY dept_no;

select emp_no, dept_no, from_date, to_date from dept_emp where to_date = str_to_date('1996', '%Y-%m-%d');


select emp_no, dept_no, from_date, to_date from  (select emp_no, dept_no, from_date, to_date from dept_emp where from_date >= str_to_date('1996', '%Y-%m-%d')  ) temp where temp.to_date <=  str_to_date('1996', '%Y-%m-%d')

select emp_no, dept_no, from_date, to_date, count(*) dept_num from dept_emp group by dept_no;
select emp_no, dept_no, from_date, to_date, count(*) dept_num from dept_emp where to_date < str_to_date('9999', '%Y-%m-%d') group by dept_no;

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

# 平均值 salaries, 
select
	det.emp_no,
	det.dept_no,
	det.from_date,
	det.to_date,
	sals.salary
from
	dept_emp det
left join
	salaries sals
on
	sals.emp_no = det.emp_no
group by
	year(det.from_date), det.dept_no

desc employees;

select
	det.emp_no,
	det.dept_no,
	det.from_date,
	det.to_date,
	avg(sals.salary) as sal
from
	dept_emp det
left join
	salaries sals
on
	sals.emp_no = det.emp_no
group by
	det.dept_no, year(det.to_date)

select * from (select dept_name, dept_no from departments) as db

# 每月各个部门支出的总数 # 10010 最大时间 now  

select emp_no, count(*) num from dept_emp GROUP BY emp_no HAVING num > 1;

select * from dept_emp where emp_no = 10010;

select str_to_date(now(), '%Y-%m-%d') n;



select
	emp_no,
	salary,
	from_date,
	to_date
from
	salaries
group by
	month(from_date)
having
	year(from_date) <= '1998'
and
	year(to_date) > '1998'


