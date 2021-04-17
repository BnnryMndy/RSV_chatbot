<?
    require "db_auth.php";
    $awnser_id = $_GET['awnser_id'];
    $result = $mysqli->query("SELECT reaction_id FROM `awnsers` where `awnser_id` = $awnser_id");
    $row = $result->fetch_assoc();
    echo $row["reaction_id"];
    // While($row = $result->fetch_assoc()){
    //     echo ", ".$row["reaction_id"];
    // }
?>