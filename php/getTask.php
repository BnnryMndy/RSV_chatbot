<?
    require "db_auth.php";
    $task_id = $_GET['task_id'];
    $result = $mysqli->query("SELECT * FROM `scripts_tasks` where `question_id` = $task_id");
    $row = $result->fetch_assoc();

    echo $row['question'];
?>