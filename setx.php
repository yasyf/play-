<?php

	$host = "localhost"; //database location
	$user = "yasyfcom_play"; //database username
	$pass = "Brentwood!"; //database password
	$db_name = "yasyfcom_play"; //database name
	$link = mysql_connect($host, $user, $pass);
	mysql_select_db($db_name);
	$player = $_REQUEST['player'];
	$turn = $_REQUEST['turn']; //current turn
	if ($player == 1) //side-scrolling player
	{ 
		$player1x = $_REQUEST['player1x']; //new player1x
		$sql = "UPDATE `yasyfcom_play`.`game1`
		SET player1x=".$player1x."
		WHERE turn=".$turn;
		mysql_query($sql);

	}
	elseif ($player == 2) //box-dropping player
	{ 
	$box1x = $_REQUEST['box1x']; //new box1x
	$box2x = $_REQUEST['box2x']; //new box2x
	$box3x = $_REQUEST['box3x']; //new box3x
	
		$sql = "UPDATE `yasyfcom_play`.`game1`
			SET box1x=".$box1x.",box2x=".$box2x.",box3x=".$box3x."
			WHERE turn=".$turn;
		mysql_query($sql);

	}

?>