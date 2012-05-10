<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}

include 'vars.php';
$player = $_REQUEST['player'];
$turn = $_REQUEST['turn']; //current turn
if ($player == 1) { //side-scrolling player

    $sql = "SELECT player2ready FROM `" . $game . "` WHERE turn=" . $turn;


    $result = mysql_query($sql);
    while ($data = mysql_fetch_row($result)) {
        echo("player2ready=$data[0]");
    }
} elseif ($player == 2) { //box-dropping player


    $sql = "SELECT player1ready FROM `" . $game . "` WHERE turn=" . $turn;


    $result = mysql_query($sql);
    while ($data = mysql_fetch_row($result)) {
        echo("player1ready=$data[0]");
    }
}
?>