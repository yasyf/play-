<?php
	$game = $_REQUEST['game'];
	if (!isset($game)) {
	exit("game not set");
	}
	$player = $_REQUEST['player'];
	if (!isset($player)) {
	exit("player not set");
	}
	$host = "localhost"; //database location
		$user = "yasyfcom_play"; //database username
		$pass = "Brentwood!"; //database password
		$db_name = "yasyfcom_play"; //database name
		$link = mysql_connect($host, $user, $pass);
		mysql_select_db($db_name);
		
		$sql="SELECT * FROM $game";
			$result=@mysql_query($sql);
			if (!$result)
			{
			echo("opponentFound=false");	
			}
else {
	
$sql2 = "SELECT `table` FROM `active` WHERE `player`='".$player."' AND `table`='".$game."'";
$result = mysql_query($sql2);
		$data = mysql_fetch_row($result);
				$game = $data[0];
				if(isset($game))
				{
				//no oppenent yet!
				echo("opponentFound=false");
				}
				else {
				//there is an opponent!
					echo("opponentFound=true");
				}
				}
?>