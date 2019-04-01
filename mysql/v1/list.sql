# 一个人可以所属多个部门
select emp.first_name, emp.last_name, dep.dept_name from employees as emp
	left join dept_emp as dept on emp.emp_no = dept.emp_no
	left join departments as dep on dept.dept_no = dep.dept_no;

# 一个人属于多个部门的用,连接
select emp.emp_no, emp.first_name, emp.last_name, group_concat(dep.dept_name) from employees as emp
				left join dept_emp as dept on emp.emp_no = dept.emp_no
				left join departments as dep on dept.dept_no = dep.dept_no
				group by emp.emp_no;

# 求每个部门中money最高的那个人的名字
select dept.emp_no, dep.dept_no, dep.dept_name, max(sal.salary) from departments as dep
	left join dept_emp as dept on dept.dept_no = dep.dept_no
	left join employees as emp on dept.emp_no = emp.emp_no
    left join salaries as sal on sal.emp_no = emp.emp_no
	group by dep.dept_name; # 最大额-144866

select dept.emp_no, max(sal.salary), dept.dept_no from dept_emp as dept
	left join salaries as sal on sal.emp_no = dept.emp_no
	where dept.dept_no = 'd009'; # 条数-223644 最大额-144866


# 每年入职人数  35316 共6年数据
select count(*) as people, YEAR(hire_date) as entry_date from employees group by YEAR(hire_date) order by entry_date desc;
# 指定年份间每年入职人数
select count(*) as people, YEAR(hire_date) as entry_date from employees where hire_date > str_to_date('1992', '%Y-%m-%d') and hire_date <= str_to_date('1997', '%Y-%m-%d')  group by YEAR(hire_date) order by entry_date desc;
# 数据验证
select hire_date from employees where hire_date >= str_to_date('2000', '%Y-%m-%d') and hire_date < str_to_date('2001', '%Y-%m-%d');