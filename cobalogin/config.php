<?php 
    $host   = "localhost";
    $user   = "root";
    $pass   = "yahuya";
    $dbnm   = "db_poliklinik";

    $conn = mysqli_connect($host,$user,$pass);
    if($conn){

        $buka = mysqli_select_db($conn, $dbnm);

        if(!$buka){
            die("Database tidak dapat dibuka");
        }

    }else{
        die("Server MySQL tidak terhubung");
    }
