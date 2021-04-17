<?
    require "db_auth.php";
    $script_id = $_GET['script_id'];
    $result = $mysqli->query("SELECT question_id FROM `scripts_tasks` where `script_id` = $script_id");
    $row = $result->fetch_assoc();
    echo $row["question_id"];
    While($row = $result->fetch_assoc()){
        echo ", ".$row["question_id"];
    }
?>