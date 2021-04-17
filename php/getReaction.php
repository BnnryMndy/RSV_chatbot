<?
    require "db_auth.php";
    $reaction_id = $_GET['reaction_id'];
    $result = $mysqli->query("SELECT * FROM `reactions` where `reaction_id` = $reaction_id");
    $row = $result->fetch_assoc();

    echo $row['reaction_type'].":".$row['reaction_link'];
?>