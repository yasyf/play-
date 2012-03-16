<?php
	$game = $_REQUEST['game'];
	if (!isset($game)) {
	exit("game not set");
	}
	$turn = $_REQUEST['turn'];
		if (!isset($turn)) {
		exit("turn not set");
		}
	$host = "localhost"; //database location
	$user = "yasyfcom_play"; //database username
	$pass = "Brentwood!"; //database password
	$db_name = "yasyfcom_play"; //database name
	$link = mysql_connect($host, $user, $pass);
	mysql_select_db($db_name);
	
	$box1x = $_REQUEST['box1x']; //new box1x
	$box2x = $_REQUEST['box2x']; //new box2x
	$box3x = $_REQUEST['box3x']; //new box3x
	$box1y = $_REQUEST['box1y']; //new box1y
	$box2y = $_REQUEST['box2y']; //new box2y
	$box3y = $_REQUEST['box3y']; //new box3y 
	
	$sql2 = "UPDATE `yasyfcom_play`.`".$game."`
			SET box1y=".$box1y.",box2y=".$box2y.",box3y=".$box3y.",box1x=".$box1x.",box2x=".$box2x.",box3x=".$box3x."
			WHERE turn=".$turn;
			mysql_query($sql2);

	
	
	$sql = "SELECT player1x,player1y
			 FROM `yasyfcom_play`.`".$game."`
			WHERE turn=".$turn;
			$result = mysql_query($sql);
				while($data = mysql_fetch_row($result)){
				   echo("player1x=$data[0]&player1y=$data[1]");
				}
					
			
				$sql3 = "SELECT player1ready
															 FROM `yasyfcom_play`.`".$game."`
															WHERE turn=".$turn;
				
			
					
							$result = mysql_query($sql3);
								while($data = mysql_fetch_row($result)){
								   echo("&player1ready=$data[0]");
								}
?>