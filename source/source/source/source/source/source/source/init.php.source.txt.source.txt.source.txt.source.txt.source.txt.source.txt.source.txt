<?php

$game = $_REQUEST['game'];
if (!isset($game)) {
    exit("game not set");
}
include 'vars.php';
$sql = "DROP TABLE IF EXISTS `" . $game . "`"; //wipe and start over
mysql_query($sql) or die(mysql_error());
$sql3 = "CREATE TABLE IF NOT EXISTS `" . $game . "` (
  `box1y` int(1) NOT NULL,
  `box1x` int(1) NOT NULL,
  `box2y` int(1) NOT NULL,
  `box2x` int(1) NOT NULL,
  `box3y` int(1) NOT NULL,
  `box3x` int(1) NOT NULL,
  `player1y` int(1) NOT NULL,
  `player1x` int(1) NOT NULL,
  `turn` int(3) NOT NULL,
  `player1ready` tinyint(1) NOT NULL,
  `player2ready` tinyint(1) NOT NULL,
 `obstacles` int(1) NOT NULL,
 `obstacle1x` int(1) NULL,
`obstacle1y` int(1) NULL,
`obstacle2x` int(1) NULL,
`obstacle2y` int(1) NULL,
`obstacle3x` int(1) NULL,
`obstacle3y` int(1) NULL,
  PRIMARY KEY  (`turn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;";
mysql_query($sql3) or die(mysql_error()); //create and format table
$obstacleNumb = rand(0,3);
for ($j=1; $j<=3; $j++) 
{
	$obstacleprep = "obstacle".$j;
	$$obstacleprep = array
	(
	"x" => null,
	"y" => null,
	);
	
}
$uniquer = array();
for ($i=1; $i<=$obstacleNumb; $i++) {
	$obstacle = "obstacle".$i;
	${$obstacle}[x] = rand(1,5);
		${$obstacle}[y] = rand(1,3);
	while(in_array($$obstacle,$uniquer))
	{
	${$obstacle}[x] = rand(1,5);
	${$obstacle}[y] = rand(1,3);
	}
	$uniquer[$i][x] = ${$obstacle}[x];
	$uniquer[$i][y] = ${$obstacle}[y];		
	

}

$sql2 = "INSERT INTO `yasyfcom_play`.`" . $game . "` (`box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`,`obstacles`, `obstacle1x`,`obstacle1y`,`obstacle2x`,`obstacle2y`,`obstacle3x`,`obstacle3y`) VALUES ('2', '1', '2', '3', '2', '5', '2', '3', '1', '0', '0','".$obstacleNumb."','".$obstacle1[x]."','".$obstacle1[y]."','".$obstacle2[x]."','".$obstacle2[y]."','".$obstacle3[x]."','".$obstacle3[y]."')";
mysql_query($sql2) or die(mysql_error()); //populate starting data
?>