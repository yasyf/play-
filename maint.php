<?php
$auth = $_REQUEST['auth'];
if (!isset($auth)) {
    exit("auth not set");
}
include 'vars.php';

if($auth == "killall")
{
for($i=0;$i<100;$i++)
{
$tname = "game".$i;
$sql2 = "DROP TABLE IF EXISTS `" . $tname . "`"; //wipe
@mysql_query($sql2);
$sql3 = "TRUNCATE TABLE active";
@mysql_query($sql3);
echo "dropped table $tname <br />";
}
}
else
{
for($i=0;$i<100;$i++)
{
$tname = "game".$i;
$sql = "SELECT COUNT(*) FROM `$tname`";
$result = @mysql_query($sql);
$numb = @mysql_fetch_array($result);
$result = $numb[0];

if ($result == "8")
{
$sql2 = "DROP TABLE IF EXISTS `" . $tname . "`"; //wipe
@mysql_query($sql2);
echo "dropped table $tname <br />";

}
}
}
?>
