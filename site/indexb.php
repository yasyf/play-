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
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body>
<img src="images/background.jpg" class="bg" />
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
          <a class="brand" href="#">Garvey's Den</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="../source/">Source Index</a></li>
               <li><a href="../index.html">Source (Raw)</a></li>
                 <li><a href="https://github.com/yasyf/play-">Source (GitHub)</a></li>
                 <li><a href="https://github.com/yasyf/play-/zipball/master">Download Archive</a></li>
            </ul>
            
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
   <div style="text-align:center">
    <div id="flashContent">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="550" height="400" id="player2" align="middle">
				<param name="movie" value="<?php echo("../v5/$fl") ?>" />
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
				<object type="application/x-shockwave-flash" data="<?php echo("../v5/$fl") ?>" width="550" height="400">
					<param name="movie" value="<?php echo("../v5/$fl") ?>" />
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
    <p><a class="btn btn-primary btn-large" href="../source/">Source &raquo;</a></p>
</div>
</body>
</html>
