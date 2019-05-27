<?php
// 实现员工列表
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
            // 所有员工
            $sql = "select emp_no, birth_date, first_name, last_name, gender, hire_date from employees limit 1000";
            foreach($dbh->query($sql) as $row) {
                echo 'emp_no:' . $row ['emp_no'];
                echo PHP_EOL;
            }
            
        ?>
    </div>
</body>
</html>
