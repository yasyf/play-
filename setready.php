<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}

include 'vars.php';
$player = $_REQUEST['player'];
$turn = $_REQUEST['turn']; //current turn
if ($player == 1) { //side-scrolling player
    $sql = "UPDATE `" . $game . "` SET player1ready=0 WHERE turn=" . $turn;
    mysql_query($sql);
} elseif ($player == 2) { //box-dropping player
    $sql = "UPDATE `" . $game . "` SET player2ready=1 WHERE turn=" . $turn;
    mysql_query($sql);
}
?>