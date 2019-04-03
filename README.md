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

*Tip:9999的意思就是仍在职*

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

## 视图界面

[vue-飞冰](https://github.com/alibaba/ice)

## 环境说明


## 需求说明

- [x] 列表查询 员工名字、所属部门、职称、性别、入职时间
- [x] 求每个部门中薪资最高的员工
- [x] 统计各部门曾经拥有的员工数量
- [ ] 统计每个月每个部门总的支出
- [ ] 每个月每个部门平均薪资
- [x] 按工资降序排序, 若工资相同, 按入职日期升序排序. 
- [ ] 求每个部门的平均薪水, 只显示平均薪水大于5000的
- [ ] 求每个部门的平均薪水, 只显示平均薪水大于5000的，部门id为空的除外
- [ ] 查询每个工种的平均薪水, 只显示平均薪水大于5000的
- [x] 求每年入职的人数, 年份按照降序排序
- [x] 求每个部门薪水的最大值, 降序排序, 取前三名
- [x] 求人数最多的那个部门的部门名称
- [ ] 笛卡尔积(多表查询没写链接条件)
- [x] 查找last_name以K开头的雇员信息
- [x] 查找名字以字母K开头，以i结尾，并且第三个字母为o的雇员名字(First_name)、职位和所在部门号
- [ ] 查找哪些雇员的职位名不以Se开头
- [ ] 查询出employees表中的最低工资的员工信息
- [ ] 计算出每个部门的平均工资、最高工资和最低工资
- [ ] 查询薪水发放时间在1986-06-26 ~ 1987-06-25薪水高于46145号雇员并且工种与他相同的雇员情况
- [ ] 查询出在薪水发放时间在1986-06-26 ~ 1987-06-25的员工信息
- [ ] 超过经理收入的员工

- [ ] 视图是存储在数据库服务端的一张虚拟的表，视图只有结构，没有数据所有的数据都是存储在表
- [ ] 视图如何创建
- [ ] 索引如何创建

### 函数

concat `concat(e.last_name,' ',e.first_name)`

group_concat `group_concat(dep.dept_name)`

str_to_date('1986','%Y-%m-%d') 

NOW()

YEAR

MONTH

WEEK

DAY

### 参考资料

[Mysql-数据查询](https://blog.51cto.com/weijiancheng/1700535) *Tip: 表的结构不一样*

[Mysql Employees Database练习题&答案](http://t.cn/EiVd3xg)

[超过经理收入的员工](http://t.cn/EiVeXqn)