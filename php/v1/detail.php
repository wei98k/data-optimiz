<?php
// 员工详细
require_once('./db.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>员工管理系统</title>
</head>
<body>
    <div class="menu-left">
        <?php include('./left.php'); ?>
    </div>
    <div class="main">
        <?php
            $empno = $_GET['empno'];
            $sql = " where emp_no = " . $empno;
            // $sql = "select e.emp_no, birth_date, first_name, last_name, gender, hire_date, title, d.dept_no, p.dept_name from employees as e";
            // $sql .= " left join titles as t on e.emp_no = t.emp_no";
            // $sql .= " left join dept_emp as d on e.emp_no = d.emp_no";
            // $sql .= " left join departments as p on d.dept_no = p.dept_no";
            // $sql .= " where e.emp_no = " . $empno;
            
            // $result = $dbh->query($sql);
            // foreach($dbh->query($sql) as $row) {
            //     var_dump($row);
            //     echo '<br /><br />';
            // }
            

        ?>
        <ul>
            <h3>基本信息</h3>
            <?php 

                $sql1 = "select emp_no, birth_date, first_name, last_name, gender, hire_date from employees";
                $sql1 .= $sql;
                foreach($dbh->query($sql1) as $row) {
                    echo '<li>编号:'. $row['emp_no'] .'</li>';
                    echo '<li>first_name:'. $row['first_name'] .'</li>';
                    echo '<li>last_name:'. $row['last_name'] .'</li>';
                    echo '<li>性别:'. $row['gender'] .'</li>';
                    echo '<li>生日:'. $row['birth_date'] .'</li>';
                    echo '<li>入职:'. $row['hire_date'] .'</li>';
                }
            ?>
        </ul>
        <ul>
            <h3>部门信息</h3>
            <?php 
                $sql2 = "select d.emp_no, d.dept_no, from_date, to_date, p.dept_name  from dept_emp d";
                $sql2 .= " left join departments as p on d.dept_no = p.dept_no";
                $sql2 .= $sql;
                foreach($dbh->query($sql2) as $row) {
                    echo '<li>部门:'. $row['dept_name'] .'</li>';    
                }
            ?>
        </ul>
        <ul>
            <h3>职位变化</h3>
            <?php 
                $sql3 = "select emp_no, title, from_date, to_date  from titles";
                $sql3 .= $sql;
                foreach($dbh->query($sql3) as $row) {
                    echo '<li>职称:'. $row['title'] .'-开始:'.$row['from_date'].'-结束:'.$row['to_date'].'</li>';    
                }
            ?>
        </ul>
        <ul>
            <h3>工资发放</h3>
            <?php 
                $sql4 = "select emp_no, salary, from_date, to_date  from salaries";
                $sql4 .= $sql;
                foreach($dbh->query($sql4) as $row) {
                    echo '<li>工资:'. $row['salary'] .'-开始:'.$row['from_date'].'-结束:'.$row['to_date'].'</li>';    
                }
            ?>
        </ul>
    </div>
</body>
</html>