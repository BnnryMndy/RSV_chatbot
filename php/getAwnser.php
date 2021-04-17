<?
    require "db_auth.php";
    $awnser_id = $_GET['awnser_id'];
    $result = $mysqli->query("SELECT * FROM `awnsers` where `awnser_id` = $awnser_id");
    $row = $result->fetch_assoc();

    echo $row['awnser'];
?>