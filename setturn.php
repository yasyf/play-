<?php
$game = $_REQUEST['game'];
if (!isset($game)) {
exit("game not set");
}

	include 'vars.php';
	$player = $_REQUEST['player'];
	$turn = $_REQUEST['turn']; //current turn
	
	if ($player == 1) //side-scrolling player
	{ 
		$sql3 = "UPDATE `yasyfcom_play`.`".$game."`
		SET player1ready=1
		WHERE turn=".$turn;
		mysql_query($sql3);

	}
	elseif ($player == 2) //box-dropping player
	{ 
		$sql3 = "UPDATE `yasyfcom_play`.`".$game."`
		SET player2ready=1
		WHERE turn=".$turn;
		mysql_query($sql3);

	}
      $sql2 =  "SELECT *
		 FROM `yasyfcom_play`.`".$game."`
		WHERE turn=".($turn + 1);
		$result=@mysql_query($sql2);
		$data = @mysql_fetch_row($result);
		
		if (!$data)
					{

					$sql = "INSERT INTO `yasyfcom_play`.`".$game."`(`box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`)
					(SELECT box1y, box1x, box2y, box2x, box3y, box3x, player1y, player1x, ".($turn + 1).", 1, 0
					FROM `yasyfcom_play`.`".$game."` WHERE turn=".$turn.")";
						mysql_query($sql)or die(mysql_error());

					}


?>