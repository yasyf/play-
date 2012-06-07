<?php
$me =  $_REQUEST["me"];
if($me == "1")
{
$fl = "play.swf";
}
else if($me == "2")
{
$fl = "player2.swf";
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Garvey's Den</title>
    <link href="../site/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../site/css/bootstrap-responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body>
<img src="../site/images/background.jpg" class="bg" />
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
             <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="../site/">Garvey's Den</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="../site/">Home</a></li>
			  <li><a href="http://yasyf.github.com/play-/" target=_blank">Readme</a></li>
              <li><a href="../source/" target=_blank">Source Index</a></li>
               <li><a href="../index.html" target=_blank">Source (Raw)</a></li>
                 <li><a href="https://github.com/yasyf/play-" target=_blank">Source (GitHub)</a></li>
                 <li><a href="https://github.com/yasyf/play-/zipball/master" target=_blank">Download Archive</a></li>
            </ul>
            
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
   <div style="text-align:center">
    <div id="flashContent">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="550" height="400" id="player2" align="middle">
				<param name="movie" value="<?php echo("$fl") ?>" />
				<param name="quality" value="autohigh" />
				<param name="bgcolor" value="#00005b" />
				<param name="play" value="true" />
				<param name="loop" value="false" />
				<param name="wmode" value="window" />
				<param name="scale" value="showall" />
				<param name="menu" value="false" />
				<param name="devicefont" value="false" />
				<param name="salign" value="" />
				<param name="allowScriptAccess" value="sameDomain" />
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="<?php echo("$fl") ?>" width="550" height="400">
					<param name="movie" value="<?php echo("$fl") ?>" />
					<param name="quality" value="autohigh" />
					<param name="bgcolor" value="#00005b" />
					<param name="play" value="true" />
					<param name="loop" value="false" />
					<param name="wmode" value="window" />
					<param name="scale" value="showall" />
					<param name="menu" value="false" />
					<param name="devicefont" value="false" />
					<param name="salign" value="" />
					<param name="allowScriptAccess" value="sameDomain" />
				<!--<![endif]-->
					<a href="http://www.adobe.com/go/getflash">
						<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
					</a>
				<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		</div>
		<h1>Instructions:</h1>
	<div class="row">
<?php
if($me != "2")
{
?>
	  <div class="span4 offset1">
<h2>Player 1:</h2> <br />
Use the arrow keys to move your player around<br />
You have nine turns to move your player<br />
One direction,one square per turn<br />
Your opponent will be rearanging the falling blocks above you<br />
He will move one to any location per turn<br />
The blocks will fall closer one increment each turn<br />
After the 8th turn, if you are not hit by a landing block, you win!<br />
</div>
<?php
}
if($me != "1")
{
?>
  <div class="span4 offset4">
<h2>Player 2:</h2><br />
Use your mouse to drag the block around<br />
You have nine turns to move your block<br />
One block per turn<br />
Your opponent will be moving his player to avoid your blocks<br />
He will move one direction,one square per turn <br />
The blocks will fall down one increment each turn<br />
After the 8th turn, if you hit him with a landing block, you win!<br />
</div>
<?php
}
?>
</div>
    <p><a class="btn btn-primary btn-large" href="../source/" target=_blank">Source &raquo;</a></p>
<p>&copy; Copyright 2012 <a href="http://www.yasyf.com" target="_blank">Yasyf Mohamedali</a> and Rafay Chaudry. All Rights Reserved.</p>
</div>
</body>
</html>