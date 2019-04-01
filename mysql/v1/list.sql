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
