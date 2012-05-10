<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}

include 'vars.php';
$player = $_REQUEST['player'];
$turn = $_REQUEST['turn']; //current turn
if ($player == 1) { //side-scrolling player
    $sql = "SELECT player1y FROM `" . $game . "` WHERE turn=" . $turn;
    $result = mysql_query($sql);
    while ($data = mysql_fetch_row($result)) {
        echo("player1y=$data[0]");
    }
} elseif ($player == 2) { //box-dropping player
//	$box = $_REQUEST['box']; //box to get
    $sql = "SELECT box1y,box2y,box3y FROM `" . $game . "` WHERE turn=" . $turn;
    $result = mysql_query($sql);
    while ($data = mysql_fetch_row($result)) {
        echo("box1y=$data[0]&box2y=$data[1]&box3y=$data[2]");
    }
}
?>