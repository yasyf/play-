<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}
$turn = $_REQUEST['turn'];
if (!isset($turn)) {
    exit("turn not set");
}
include 'vars.php';
$player1x = $_REQUEST['player1x'];
$player1y = $_REQUEST['player1y'];
$setready = $_REQUEST['setready'];

$sql2 = "UPDATE `" . $game . "` SET player1x=" . $player1x . ", player1y=" . $player1y . " WHERE turn=" . $turn;
mysql_query($sql2);

if ($setready == true) {

    $sql4 = "UPDATE `" . $game . "` SET player1ready=0 WHERE turn=" . $turn;
    mysql_query($sql4);
}


$sql = "SELECT box1x,box2x,box3x,box1y,box2y,box3y FROM `" . $game . "` WHERE turn=" . $turn;
$result = mysql_query($sql);
while ($data = mysql_fetch_row($result)) {
    echo("box1x=$data[0]&box2x=$data[1]&box3x=$data[2]&box1y=$data[3]&box2y=$data[4]&box3y=$data[5]");
}

$sql3 = "SELECT player2ready FROM `" . $game . "` WHERE turn=" . $turn;


$result = mysql_query($sql3);
while ($data = mysql_fetch_row($result)) {
    echo("&player2ready=$data[0]");
}
?>