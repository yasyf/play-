<?php
$host = "localhost"; //database location
$user = "yasyfcom_play"; //database username
$pass = "Brentwood!"; //database password
$db_name = "yasyfcom_play"; //database name
$link = mysql_connect($host, $user, $pass);
mysql_select_db($db_name);
$turn = $_REQUEST['turn']; //new (next) turn

$sql = "INSERT INTO `yasyfcom_play`.`game1`(`box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`)
(SELECT box1y, box1x, box2y, box2x, box3y, box3x, player1y, player1x, ".$turn.", player1ready, player2ready
FROM `yasyfcom_play`.`game1` WHERE turn=".($turn - 1).")";
	mysql_query($sql);

?>