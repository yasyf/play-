<?php

//JUST check for current games
include 'vars.php';
$sql = "SELECT `table` FROM `active`";
$result = mysql_query($sql);
$data = mysql_fetch_row($result);
$game = $data[0];

    $sql4 = "SELECT `player` FROM `active` WHERE `table`= '" . $game . "'";
   $result2 = mysql_query($sql4); 
$data2 = mysql_fetch_row($result2);
$player = $data2[0];
	header("Expires: Mon, 26 Jul 1990 05:00:00 GMT");
	header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
	header("Cache-Control: no-store, no-cache, must-revalidate");
	header("Cache-Control: post-check=0, pre-check=0", false);
	header("Pragma: no-cache");
if($player == "1")
{
header("Location: v5/indexb.php?me=2&nocache=".time());
}
else
{
header("Location: v5/indexb.php?me=1&nocache=".time());
}
?>