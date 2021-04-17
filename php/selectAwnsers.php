<?
    require "db_auth.php";
    $question_id = $_GET['question_id'];
    $result = $mysqli->query("SELECT awnser_id FROM `awnsers` where `question_id` = $question_id");
    $row = $result->fetch_assoc();
    echo $row["awnser_id"];
    While($row = $result->fetch_assoc()){
        echo ", ".$row["awnser_id"];
    }
?>