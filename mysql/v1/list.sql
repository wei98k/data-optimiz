# 一个人可以所属多个部门
select emp.first_name, dep.dept_name from employees as emp
	left join dept_emp as dept on emp.emp_no = dept.emp_no
	left join departments as dep on dept.dept_no = dep.dept_no;