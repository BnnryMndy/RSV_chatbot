<?
    require "db_auth.php";
    $script_id = $_GET['script_id'];
    $result = $mysqli->query("SELECT * FROM `scripts_tasks` where `script_id` = $script_id");
    While($row = $result->fetch_assoc()){
        echo json_encode($row);
    }
 
     
?>