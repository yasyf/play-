<?php
$host = "localhost"; //database location
$user = "yasyfcom_play"; //database username
$pass = "Brentwood!"; //database password
$db_name = "yasyfcom_play"; //database name
$link = mysql_connect($host, $user, $pass);
mysql_select_db($db_name);
$sql = "TRUNCATE TABLE `game1`"; //wipe and start over
mysql_query($sql);
$sql2 = "INSERT INTO `yasyfcom_play`.`game1` (`box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`) VALUES ('2', '1', '2', '3', '2', '5', '2', '3', '1', '0', '0')";
mysql_query($sql2);
?>