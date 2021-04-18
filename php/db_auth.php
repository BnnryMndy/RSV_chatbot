<?php
    $host = 'localhost';
    $user = 'root';
    $password = 'root';
    $database = 'rsv_chatbot';

    $mysqli = new mysqli($host, $user, $password, $database);
    if (mysqli_connect_errno()) {
        printf("Подключение к серверу MySQL невозможно. Код ошибки: %s<br>", mysqli_connect_error());
        exit;
    }
