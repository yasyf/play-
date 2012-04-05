<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}
include 'vars.php';
$sql = "DROP TABLE IF EXISTS `" . $game . "`"; //wipe and start over
mysql_query($sql) or die(mysql_error());
$sql4 = "DELETE FROM `yasyfcom_play`.`active` WHERE `table`= '" . $game . "'";
mysql_query($sql4) or die(mysql_error()); //log game closing
?>