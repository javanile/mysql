<?php

$con = mysqli_connect("mysql", "root", "secret", "database");

if (mysqli_connect_errno()) {
    printf("connection failed: %s\n", mysqli_connect_error());
    exit();
}

$query = "SELECT VERSION()";

$res = mysqli_query($con, $query);

if ($res) {
    $row = mysqli_fetch_row($res);
    echo 'MySQL version: '.$row[0].PHP_EOL;
}

mysqli_free_result($res);
mysqli_close($con);
