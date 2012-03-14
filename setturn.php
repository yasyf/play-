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
$turn = $_REQUEST['turn']; //new (next) turn

$sql = "INSERT INTO `yasyfcom_play`.`".$game."`(`box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`)
(SELECT box1y, box1x, box2y, box2x, box3y, box3x, player1y, player1x, ".$turn.", 0, 0
FROM `yasyfcom_play`.`".$game."` WHERE turn=".$turn.")";
	mysql_query($sql)or die(mysql_error());

?>