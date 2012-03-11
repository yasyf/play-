<?php
	//check for current games
	$host = "localhost"; //database location
	$user = "yasyfcom_play"; //database username
	$pass = "Brentwood!"; //database password
	$db_name = "yasyfcom_play"; //database name
	$link = mysql_connect($host, $user, $pass);
	mysql_select_db($db_name);
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
echo("game=$table");

?>