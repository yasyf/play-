<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}
include 'vars.php';
$player = $_REQUEST['player'];
$turn = $_REQUEST['turn']; //current turn
if ($player == 1) { //side-scrolling player
    $player1y = $_REQUEST['player1y'];
    $sql = "UPDATE `yasyfcom_play`.`" . $game . "` SET player1y=" . $player1y . " WHERE turn=" . $turn;
    mysql_query($sql) or die(mysql_error());
} elseif ($player == 2) { //box-dropping player
    $box1y = $_REQUEST['box1y']; //new box1y
    $box2y = $_REQUEST['box2y']; //new box2y
    $box3y = $_REQUEST['box3y']; //new box3y

    $sql = "UPDATE `yasyfcom_play`.`" . $game . "` SET box1y=" . $box1y . ",box2y=" . $box2y . ",box3y=" . $box3y . " HERE turn=" . $turn;
    mysql_query($sql);
}
?>