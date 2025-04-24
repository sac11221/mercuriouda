<?php
    $conn = new mysqli("localhost","mercurioevent","","my_mercurioevent");

    if($conn->connect_errno){
        die("Connessione al database fallita: " . $conn->error());
    }
?>