<?php
$host = "localhost"; //database location
$user = "yasyfcom_play"; //database username
$pass = "Brentwood!"; //database password
$db_name = "yasyfcom_play"; //database name
$link = mysql_connect($host, $user, $pass);
mysql_select_db($db_name);
$player = $_REQUEST['player'];
$turn = $_REQUEST['turn']; //current turn
if ($player == 1) //side-scrolling player
{ 
	$sql = "UPDATE `yasyfcom_play`.`game1`
	SET player1ready=1
	WHERE turn=".$turn;
	mysql_query($sql);

}
elseif ($player == 2) //box-dropping player
{ 
	$sql = "UPDATE `yasyfcom_play`.`game1`
	SET player2ready=1
	WHERE turn=".$turn;
	mysql_query($sql);

}
?>