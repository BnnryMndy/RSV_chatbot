<?php
    require "db_auth.php";
    $script_name = $_POST["scriptName"];
    
    $result = $mysqli->query("INSERT INTO `scripts`(`Script_name`) VALUES ($script_name)");  

?>