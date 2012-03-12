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
$sql3 = "CREATE TABLE IF NOT EXISTS `".$game."` (
  `box1y` int(1) NOT NULL,
  `box1x` int(1) NOT NULL,
  `box2y` int(1) NOT NULL,
  `box2x` int(1) NOT NULL,
  `box3y` int(1) NOT NULL,
  `box3x` int(1) NOT NULL,
  `player1y` int(1) NOT NULL,
  `player1x` int(1) NOT NULL,
  `turn` int(3) NOT NULL,
  `player1ready` tinyint(1) NOT NULL,
  `player2ready` tinyint(1) NOT NULL,
  PRIMARY KEY  (`turn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;";
mysql_query($sql3)or die(mysql_error()); //create and format table
$sql2 = "INSERT INTO `yasyfcom_play`.`".$game."` (`box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`) VALUES ('2', '1', '2', '3', '2', '5', '2', '3', '1', '0', '0')";
mysql_query($sql2)or die(mysql_error()); //populate starting data
?>