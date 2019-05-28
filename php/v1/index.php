<?php
// 实现员工列表
require_once('./db.php');
include('./page.class.php');
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
    <table border=1>
        <tr>
            <th>编号</th>
            <th>first_name</th>
            <th>last_name</th>
            <th>职称</th>
            <th>工资</th>
            <th>在职</th>
            <th>性别</th>
            <th>生日</th>
            <th>入职时间</th>
        </tr>
        <?php 
            // 所有员工
            $sql = "select 
                    e.emp_no, birth_date, first_name, last_name, gender, hire_date, max(s.salary) as salary,
                    (select title from titles as t where t.emp_no = e.emp_no order by to_date desc limit 1) as title,
                    (select to_date from titles as t where t.emp_no = e.emp_no order by to_date desc limit 1) as worktime
                    from employees as e";
            // $sql .= " where e.last_name like '%Rem%'";
            $sql .= " left join salaries s on e.emp_no = s.emp_no";
            // $sql .= " having max(s.salary)";
            $sql .= " order by e.birth_date";
            $sql .= " limit 50";
            echo $sql;
            foreach($dbh->query($sql) as $row) {
                echo '<tr>';
                echo '<td><a href="./detail.php?empno='.$row ['emp_no'].'"> '. $row ['emp_no'] .'</a></td>';
                echo '<td>'. $row ['first_name'] .'</td>';
                echo '<td>'. $row ['last_name'] .'</td>';
                echo '<td>'. $row ['title'] .'</td>';
                echo '<td>'. $row ['salary'] .'</td>';
                if($row ['worktime'] == '9999-01-01') {
                    echo '<td>'. '是' .'</td>';
                } else {
                    echo '<td>'. '否' .'</td>';
                }
                echo '<td>'. $row ['gender'] .'</td>';
                echo '<td>'. $row ['birth_date'] .'</td>';
                echo '<td>'. $row ['hire_date'] .'</td>';
                echo '</tr>';
            }
            
        ?>
        </table>
    </div>
</body>
</html>
