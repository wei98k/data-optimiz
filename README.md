# data-optimiz

mysql 优化

导入数据库: `mysql -u root -p -t  <  employees.sql`

[数据-employees](https://github.com/datacharmer/test_db)

[数据表关系图](https://dev.mysql.com/doc/employee/en/sakila-structure.html)

### departments 部门表

| 字段 | 类型 | 长度 | 备注 |
|:---:|:-----:|:----:|:---:|
| dept_no | char | 4 | 部门编号 | 
| dept_name | varchar | 40 | 部门名称 |

### employees 人员表

| 字段 | 类型 | 长度 | 备注 |
|:---:|:-----:|:----:|:---:|
| emp_no | int | 11 | 主键-编号 |
| birth_date | date | 0 | 员工生日 |
| first_name | varchar | 14 | 名字 |
| last_name | varchar | 16 | 姓名 | 
| gender | enum | 0 | 性别 |
| hire_date | date | 0 | 入职时间 | 

### salaries 工资表

| 字段 | 类型 | 长度 | 备注 |
|:---:|:-----:|:----:|:---:|
| emp_no | int | 11 | 员工表-employees.emp_no |
| salary | int | 11 | 工资 | 
| from_date | date | 0 | 开始时间 | 
| to_date | date | 0 | 结束时间 |

### titles 职称表

| 字段 | 类型 | 长度 | 备注 |
|:---:|:-----:|:----:|:---:|
| emp_no | int | 11 | 员工表-employees.emp_no |
| title | varchar | 50 | 职称标题 |
| from_date | date | 0 | 开始时间(开始担任职称) |
| to_date | date | 0 | 结束时间(结束担任职称) |

### dept_emp 员工所属部门表

| 字段 | 类型 | 长度 | 备注 |
|:---:|:-----:|:----:|:---:|
| dept_no | char | 4 | 部门编号-departments.dept_no|
| emp_no | int | 11 | 人员表-employees.emp_no |
| from_date | date | 0 | 开始时间(进入该部门时间) |
| to_date | date | 0 | 结束时间(离开该部门时间) |

### dept_manager 管理者所属部门表

| 字段 | 类型 | 长度 | 备注 |
|:---:|:-----:|:----:|:---:|
| emp_no | char | 4 |  人员表-departments.emp_no|
| dept_no | int | 11 | 部门编号-employees.dept_no |
| from_date | date | 0 | 开始时间(进入该部门时间) |
| to_date | date | 0 | 结束时间(离开该部门时间) |


## 环境说明


## 需求说明

- [ ]列表查询 员工名字、所属部门、职称、性别、入职时间



