<?php
	//check for current games, if not, create one
	$player = $_REQUEST['player'];
	if (!isset($player)) {
	exit("player not set");
	}
	$include 'vars.php';	switch ($player) {
			case 1:
			$opponent = 2;
			break;
			case 2:
			$opponent = 1;
			break;
	}
	
	$sql2 = "SELECT `table` FROM `active` WHERE `player`='".$opponent."'";
			$result = mysql_query($sql2);
				$data = mysql_fetch_row($result);
						$game = $data[0];
						if(isset($game))
						{
						//echo("game found!");
$sql4 = "DELETE FROM `yasyfcom_play`.`active` WHERE `table`= '".$game."'";
	mysql_query($sql4)or die(mysql_error()); //log game closing
					echo("game=$game");
						}
						else {
							
	//echo("game created!");
while (!$finished) {
	$game = rand ( 0, 99);
	$table = "game".$game;

	$sql="SELECT * FROM $table";
	$result=@mysql_query($sql);
	if (!$result)
	{
	$finished = true;
	}
}
$sql4 = "INSERT INTO `yasyfcom_play`.`active` (`table`,`player`) VALUES ('".$table."','".$player."')";
mysql_query($sql4)or die(mysql_error()); //log game opening
echo("game=$table");
}
?>