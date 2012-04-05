<?php

//JUST check for current games
include 'vars.php';
$sql = "SELECT `table` FROM `active`";
$result = mysql_query($sql);
$data = mysql_fetch_row($result);
$game = $data[0];
if (isset($game)) {

    echo("game=$data[0]");


    $sql4 = "DELETE FROM `yasyfcom_play`.`active` WHERE `table`= '" . $game . "'";
    mysql_query($sql4) or die(mysql_error()); //log game closing
} else {
    echo("no existing games");
}
?>