<?php
$game = $_REQUEST['game'];
if (!isset($game)) {
exit("game not set");
}
$host = "localhost"; //database location
$user = "yasyfcom_play"; //database username
$pass = "Brentwood!"; //database password
$db_name = "yasyfcom_play"; //database name
$link = mysql_connect($host, $user, $pass);
mysql_select_db($db_name);
$sql = "DROP TABLE IF EXISTS `".$game."`"; //wipe and start over
mysql_query($sql)or die(mysql_error());
$sql4 = "DELETE FROM `yasyfcom_play`.`active` WHERE `table`= '".$game."'";
	mysql_query($sql4)or die(mysql_error()); //log game closing
?>