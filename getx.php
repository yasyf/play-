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
	$player = $_REQUEST['player'];
	$turn = $_REQUEST['turn']; //current turn
	if ($player == 1) //side-scrolling player
	{ 
		$sql = "SELECT player1x
		 FROM `yasyfcom_play`.`".$game."`
		WHERE turn=".$turn;
		$result = mysql_query($sql);
		while($data = mysql_fetch_row($result)){
		  echo("player1x=$data[0]");
		}

	}
	elseif ($player == 2) //box-dropping player
	{ 
//	$box = $_REQUEST['box']; //box to get
	$sql = "SELECT box1x,box2x,box3x
		 FROM `yasyfcom_play`.`".$game."`
		WHERE turn=".$turn;
		$result = mysql_query($sql);
		while($data = mysql_fetch_row($result)){
		   echo("box1x=$data[0]&box2x=$data[1]&box3x=$data[2]");
		}

	}

?>