<?php

$host = "localhost"; //database location
$user = "yasyf_play"; //database username
$pass = "Brentwood!"; //database password
$db_name = "yasyf_play"; //database name
$link = mysql_connect($host, $user, $pass);
 if (!$link)
    die('Could not connect: ' . mysql_error());
mysql_select_db($db_name);
?>