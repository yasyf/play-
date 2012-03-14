function getReady()
{
	_root.getreadybool = false;
	//getready
	getready = new LoadVars();
	getready.game = _root.game;
	getready.player = _root.iamplayer;
	getready.turn = _root.turn;
	getready.sendAndLoad("http://direct.yasyf.com/play/getready.php",getready,"POST");
	getready.onLoad = function(success)
	{
		_root.player2ready = getready.player2ready;
		_root.getreadybool = true;
		trace("player2ready: " + getready.player2ready);
	};
	//getready
}
function checkFound()
{
	_root.opponentFinding = true;
	opponentFoundd = new LoadVars();
	opponentFoundd.player = _root.iamplayer;
	opponentFoundd.game = _root.game;
	opponentFoundd.sendAndLoad("http://direct.yasyf.com/play/checkgame.php",opponentFoundd,"POST");
	opponentFoundd.onLoad = function(success)
	{
		_root.opponentFound = opponentFoundd.opponentFound;
		trace("Opponent Found:" + _root.opponentFound);
		_root.opponentFinding = false;
	};
}
function getVars()
{
	_root.getxbool = false;
	_root.getybool = false;
	_root.getboxxbool = false;
	_root.getboxybool = false;

	//getx
	getx = new LoadVars();
	getx.game = _root.game;
	getx.player = 1;
	getx.turn = _root.turn;
	getx.sendAndLoad("http://direct.yasyf.com/play/getx.php",getx,"POST");
	getx.onLoad = function(success)
	{
		_root.player1x = getx.player1x;
		_root.getxbool = true;
		trace("player1x: " + getx.player1x);
	};
	//getx
	//--

	//gety
	gety = new LoadVars();
	gety.game = _root.game;
	gety.player = 1;
	gety.turn = _root.turn;
	gety.sendAndLoad("http://direct.yasyf.com/play/gety.php",gety,"POST");
	gety.onLoad = function(success)
	{
		_root.player1y = gety.player1y;
		_root.getybool = true;
		trace("player1y: " + gety.player1y);
	};
	//gety
	//--
	//getboxx
	getboxx = new LoadVars();
	getboxx.game = _root.game;
	getboxx.player = 2;
	getboxx.turn = _root.turn;
	getboxx.sendAndLoad("http://direct.yasyf.com/play/getx.php",getboxx,"POST");
	getboxx.onLoad = function(success)
	{
		_root.box1x = getboxx.box1x;
		_root.box2x = getboxx.box2x;
		_root.box3x = getboxx.box3x;
		_root.getboxxbool = true;
		trace("box1x:" + _root.box1x);
		trace("box2x:" + _root.box2x);
		trace("box3x:" + _root.box3x);
	};
	//getboxx
	//--
	//--
	//getboxy
	getboxy = new LoadVars();
	getboxy.game = _root.game;
	getboxy.player = 2;
	getboxy.turn = _root.turn;
	getboxy.sendAndLoad("http://direct.yasyf.com/play/gety.php",getboxy,"POST");
	getboxy.onLoad = function(success)
	{
		_root.box1y = getboxy.box1y;
		_root.box2y = getboxy.box2y;
		_root.box3y = getboxy.box3y;
		_root.getboxybool = true;
		trace("box1y:" + _root.box1y);
		trace("box2y:" + _root.box2y);
		trace("box3y:" + _root.box3y);
	};
	//getboxx
	//--

}
function plusTurn()
{
	_root.setturnbool = false;
	_root.player1x = _root.player.cellx;
	_root.player1y = _root.player.celly;
	_root.sendVars();
	_root.varsSent = true;

	setturn = new LoadVars();
	setturn.game = _root.game;
	setturn.player = _root.iamplayer;
	setturn.turn = (_root.turn + 1);
	setturn.sendAndLoad("http://direct.yasyf.com/play/setturn.php",setturn,"POST");
	setturn.onLoad = function(success)
	{
		_root.turn++;
		trace("Next Turn! (Turn " + _root.turn + ")");//Next Turn
		_root.setturnbool = true;
		//getready
		getready = new LoadVars();
		getready.game = _root.game;
		getready.player = _root.iamplayer;
		getready.turn = _root.turn;
		getready.sendAndLoad("http://direct.yasyf.com/play/getready.php",getready,"POST");
		getready.onLoad = function(success)
		{
			_root.player2ready = getready.player2ready;

			trace("player2ready: " + getready.player2ready);
		};
		//getready
		_root.getVars();
	};
}
function exit()
{

	exiter = new LoadVars();
	exiter.game = _root.game;
	exiter.sendAndLoad("http://direct.yasyf.com/play/exit.php",exiter,"POST");
	exiter.onLoad = function(success)
	{
		_root.exiterbool = true;
		trace("exit cleanup done");
	};

}
function sendVars()
{
	_root.setxbool = false;
	_root.setybool = false;
	_root.setreadybool = false;

	setx = new LoadVars();
	setx.game = _root.game;
	setx.player = _root.iamplayer;
	setx.turn = _root.turn;
	setx.player1x = _root.player1x;
	setx.sendAndLoad("http://direct.yasyf.com/play/setx.php",setx,"POST");
	setx.onLoad = function(success)
	{
		_root.setxbool = true;
		trace("New X! (X=" + setx.player1x + ")");//Next Turn
	};
	sety = new LoadVars();
	sety.game = _root.game;
	sety.player = _root.iamplayer;
	sety.turn = _root.turn;
	sety.player1y = _root.player1y;
	sety.sendAndLoad("http://direct.yasyf.com/play/sety.php",sety,"GET");
	sety.onLoad = function(success)
	{
		_root.setybool = true;
		trace("New Y! (Y=" + sety.player1y + ")");//Next Turn
	};
	setready = new LoadVars();
	setready.game = _root.game;
	setready.player = _root.iamplayer;
	setready.turn = _root.turn;
	setready.sendAndLoad("http://direct.yasyf.com/play/setready.php",setready,"POST");
	setready.onLoad = function(success)
	{
		_root.setreadybool = true;
		trace("player1ready!");//Next Turn
	};
}
function gridY(celly, object)
{
	//I <3 Math
	gridy = 466.55 - (133.3 * celly);
	object.gridy = gridy;
	object.celly = celly;
}
function gridX(cellx, object)
{
	//I <3 Math
	gridx = -55. + (110 * cellx);
	object.gridx = gridx;
	object.cellx = cellx;
}
function togridX(cellx, object)
{
	//I <3 Math
	gridx = -55. + (110 * cellx);
	object._x = gridx;
	object.cellx = cellx;
}
function togridY(celly, object)
{
	//I <3 Math
	gridy = 466.55 - (133.3 * celly);
	object._y = gridy;
	object.celly = celly;
}
function tocellX(gridx, object)
{
	//I <3 Math
	cellx = (55 + gridx) / 110;
	cellx = Math.round(cellx);
	object.cellx = cellx;
}
function tocellY(gridy, object)
{
	//I <3 Math
	celly = (7 / 2) - ((10 * gridy) / 1333);
	celly = Math.round(celly);
	object.celly = celly;
}

// init _x and _y position for  first cell (top right) plus the counter that sets the name (unique) and left/right and up/down
// borrowed and adapted the dynamic grid from http://www.flashvalley.com/fv_tutorials/creating_a_grid_dynamically/
initX = 0;
initY = 0;
counter = 0;
turn = 1;
_root.iamplayer = 1;//side scroller
_root.opponent = 2;
_root.timout = 1;
_root.timout = 1;
_root.opponentFinding = false;
_root.opponentFound = false;
//columns
for (i = 3; i >= 1; i--)
{
	//rows
	for (j = 1; j <= 5; j++)
	{
		counter++;
		// attach the movie clip on the stage - our dot now has the symbol attached to it
		//grid_container["cell"+counter] = the cell that the loop is on
		grid_container.attachMovie("cellMC","cell" + counter,counter);
		// We assign a _x position to the cell, and a cellx for the grid
		grid_container["cell" + counter]._x = initX;
		grid_container["cell" + counter].celly = i;
		// We assign a _y position to the cell, and a celly for the grid
		grid_container["cell" + counter]._y = initY;
		grid_container["cell" + counter].cellx = j;
		grid_container["cell" + counter].cellnumber.embedFonts = false;
		grid_container["cell" + counter].cellnumber.text = grid_container["cell" + counter]._name;
		grid_container["cell" + counter].cellnumber.text += " (" + grid_container["cell" + counter].cellx;
		grid_container["cell" + counter].cellnumber.text += "," + grid_container["cell" + counter].celly + ")";
		//when clicked
		grid_container["cell" + counter].onRelease = function()
		{
			trace(this._name + " (" + this.cellx + "," + this.celly + ")");
		};

		initX += 110;
	}
	initY += 133.30;
	initX = 0;
}
gameTable = new LoadVars();
gameTable.player = _root.iamplayer;
gameTable.sendAndLoad("http://direct.yasyf.com/play/gengame.php",gameTable,"POST");
gameTable.onLoad = function(success)
{
	_root.game = this.game;
	trace("game table: " + _root.game);//game table now loaded
	gameInit = new LoadVars();
	gameInit.game = _root.game;
	gameInit.player = _root.iamplayer;
	gameInit.sendAndLoad("http://direct.yasyf.com/play/init.php",gameInit,"POST");
	gameInit.onLoad = function(success)
	{
		trace("Game Table Initialized");//game table now initialized
		getVars();
		getReady();


	};
};

stop();