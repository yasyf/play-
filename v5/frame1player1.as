import mx.transitions.Tween;
import mx.transitions.easing.*;
serverloc = "http://site5.yasyf.com/";
/**
* Custom ptrace() method that prepends player ID
* @param pmessage
*/
function ptrace(pmessage)
{
	myMessage = "{P" + _root.iamplayer + "} " + pmessage;
	trace(myMessage);
}
/**
* Send and receive relevant game variables; used for communication with server-side PHP/MySQL API; getreadybool and sendReceivebool keep track of active progress
* @param ismovemade
* @param game
* @param turn
* @param setready
* @param player1x
* @param player1y
* @param box1x
* @param box1y
* @param box2x
* @param box2y
* @param box3x
* @param box3y
*/
function sendReceive(ismovemade)
{

	_root.sendReceivebool = false;
	variables = new LoadVars();
	variables.game = _root.game;
	variables.turn = _root.turn;
	variables.player1x = _root.player.cellx;
	variables.player1y = _root.player.celly;

	if (ismovemade)
	{
		variables.setready = true;

	}
	else
	{
		variables.setready = false;
	}

	variables.sendAndLoad(serverloc + "player1.php",variables,"POST");
	variables.onLoad = function(success)
	{
		_root.player2ready = variables.player2ready;
		_root.box1x = variables.box1x;
		_root.box2x = variables.box2x;
		_root.box3x = variables.box3x;
		_root.box1y = variables.box1y;
		_root.box2y = variables.box2y;
		_root.box3y = variables.box3y;

		_root.sendReceivebool = true;
		_root.getreadybool = true;

		/*ptrace("box1x:" + _root.box1x);
		ptrace("box2x:" + _root.box2x);
		ptrace("box3x:" + _root.box3x);
		ptrace("box1y:" + _root.box1y);
		ptrace("box2y:" + _root.box2y);
		ptrace("box3y:" + _root.box3y);
		ptrace("player2ready: " + variables.player2ready);
		ptrace("New Y Set! (Y=" + variables.player1y + ")");
		ptrace("New X Set! (X=" + variables.player1x + ")");*/

		_root.gridX(_root.box1x,_root.box1);
		_root.gridX(_root.box2x,_root.box2);
		_root.gridX(_root.box3x,_root.box3);
		_root.gridY(_root.box1y,_root.box1);
		_root.gridY(_root.box2y,_root.box2);
		_root.gridY(_root.box3y,_root.box3);

		var tweenX1:Tween = new Tween(_root.box1, "_x", Regular.easeOut, _root.box1._x, _root.box1.gridx, 1, true);
		var tweenX2:Tween = new Tween(_root.box2, "_x", Regular.easeOut, _root.box2._x, _root.box2.gridx, 1, true);
		var tweenX3:Tween = new Tween(_root.box3, "_x", Regular.easeOut, _root.box3._x, _root.box3.gridx, 1, true);
		var tweenY1:Tween = new Tween(_root.box1, "_y", Regular.easeOut, _root.box1._y, _root.box1.gridy, 1, true);
		var tweenY2:Tween = new Tween(_root.box2, "_y", Regular.easeOut, _root.box2._y, _root.box2.gridy, 1, true);
		var tweenY3:Tween = new Tween(_root.box3, "_y", Regular.easeOut, _root.box3._y, _root.box3.gridy, 1, true);

		if (ismovemade)
		{
			_root.movemade = true;
			ptrace("recorded move, sent");


		}
	};
}
/**
* Check with API if other player is ready; getreadybool keeps track of active progress
* @param game
* @param turn
* @param player
* @param getreadybool
*/
function getReady()
{
	_root.getreadybool = false;
	//getready
	getready = new LoadVars();
	getready.game = _root.game;
	getready.player = _root.iamplayer;
	getready.turn = _root.turn;
	getready.sendAndLoad(serverloc + "getready.php",getready,"POST");
	getready.onLoad = function(success)
	{
		_root.player2ready = getready.player2ready;
		_root.getreadybool = true;
		ptrace("player2ready: " + getready.player2ready);
	};
	//getready
}

/**
* Check with API if other player has been found; opponentFinding keeps track of active progress
* @param game
* @param turn
* @param player
* @param opponentFinding
* @param opponentFoundd
*/
function checkFound()
{
	_root.opponentFinding = true;
	opponentFoundd = new LoadVars();
	opponentFoundd.player = _root.iamplayer;
	opponentFoundd.game = _root.game;
	opponentFoundd.sendAndLoad(serverloc + "checkgame.php",opponentFoundd,"POST");
	opponentFoundd.onLoad = function(success)
	{
		_root.opponentFound = opponentFoundd.opponentFound;
		ptrace("Opponent Found:" + _root.opponentFound);
		_root.opponentFinding = false;
	};
}
/**
* Increments turn in animation, and relays to API; setturnbool keeps track of active progress
* @param game
* @param turn
* @param player
* @param setturnbool
* @param box1.scalefactor
* @param box2.scalefactor
* @param box3.scalefactor
* @param player.cellx
* @param player.celly
* @param gotya
*/
function plusTurn()
{

	_root.setturnbool = false;
	if (_root.box1.scalefactor < 80)
	{
		var tweenGrow1:Tween = new Tween(_root.box1, "scalefactor", Regular.easeOut, _root.box1.scalefactor, _root.box1.scalefactor * 1.15, 1, true);
		tweenGrow.onMotionFinished = function()
		{
			_root.box1.scalefactor = _root.box1.scalefactor * 1.15;
		};
		var tweenGrow2:Tween = new Tween(_root.box2, "scalefactor", Regular.easeOut, _root.box2.scalefactor, _root.box2.scalefactor * 1.15, 1, true);
		tweenGrow.onMotionFinished = function()
		{
			_root.box2.scalefactor = _root.box2.scalefactor * 1.15;
		};
		var tweenGrow3:Tween = new Tween(_root.box3, "scalefactor", Regular.easeOut, _root.box3.scalefactor, _root.box3.scalefactor * 1.15, 1, true);
		tweenGrow.onMotionFinished = function()
		{
			_root.box3.scalefactor = _root.box3.scalefactor * 1.15;
		};


	}
	else
	{
		_root.gotya = false;
		if (_root.box1x == _root.player.cellx and _root.box1y == _root.player.celly)
		{
			_root.gotya = true;
		}
		if (_root.box2x == _root.player.cellx and _root.box2y == _root.player.celly)
		{
			_root.gotya = true;
		}
		if (_root.box3x == _root.player.cellx and _root.box3y == _root.player.celly)
		{
			_root.gotya = true;
		}
		switch (_root.gotya)
		{
			case true :
				for (i; i < 10; i++)
				{
					ptrace("PLAYER 2 WINS");

				}
				gotoAndStop(3);
				break;
			case false :
				for (i; i < 10; i++)
				{
					ptrace("PLAYER 1 WINS");

				}
				gotoAndStop(2);
				break;
		}
		var tweenGrow1:Tween = new Tween(_root.box1, "scalefactor", Regular.easeOut, _root.box1.scalefactor, 35, 1, true);
		tweenGrow.onMotionFinished = function()
		{
			_root.box1.scalefactor = 35;
		};
		var tweenGrow2:Tween = new Tween(_root.box2, "scalefactor", Regular.easeOut, _root.box2.scalefactor, 35, 1, true);
		tweenGrow.onMotionFinished = function()
		{
			_root.box2.scalefactor = 35;
		};
		var tweenGrow3:Tween = new Tween(_root.box3, "scalefactor", Regular.easeOut, _root.box3.scalefactor, 35, 1, true);
		tweenGrow.onMotionFinished = function()
		{
			_root.box3.scalefactor = 35;
		};

		/*gameR = new LoadVars();
		gameR.game = _root.game;
		gameR.player = _root.iamplayer;
		gameR.sendAndLoad(serverloc + "init.php",gameR,"POST");
		gameR.onLoad = function(success)
		{
		_root.turn = 1;
		_root.resetBoxes();
		ptrace("Game Reset by p1");//game table now initialized
		};*/
	}
	sendReceive(false);
	setturn = new LoadVars();
	setturn.game = _root.game;
	setturn.player = _root.iamplayer;
	setturn.turn = _root.turn;
	setturn.sendAndLoad(serverloc + "setturn.php",setturn,"POST");
	setturn.onLoad = function(success)
	{
		_root.movemade = false;
		_root.turn++;
		ptrace("Next Turn! (Turn " + _root.turn + ")");//Next Turn
		_root.setturnbool = true;
	};

}



/**
* Exits game and cleans up table; exiterbool keeps track of active progress
* @param game
* @param exiterbool
*/
function exit()
{

	exiter = new LoadVars();
	exiter.game = _root.game;
	exiter.sendAndLoad(serverloc + "exit.php",exiter,"POST");
	exiter.onLoad = function(success)
	{
		_root.exiterbool = true;
		ptrace("exit cleanup done");
	};

}
/**
* Takes object's virtual cell Y coordinate, and turns it into flash grid location
* @param object
* @param celly
* @return gridy
*/
function gridY(celly, object)
{
	//I <3 Math
	gridy = 466.55 - (133.3 * celly);
	object.gridy = gridy;
	object.celly = celly;
}
/**
* Takes object's virtual cell X coordinate, and turns it into flash grid location
* @param object
* @param cellx
* @return gridx
*/
function gridX(cellx, object)
{
	//I <3 Math
	gridx = -55. + (110 * cellx);
	object.gridx = gridx;
	object.cellx = cellx;
}
/**
* Takes object's virtual cell X coordinate, and moves it to flash grid location
* @param object
* @param cellx
* @return gridx
*/
function togridX(cellx, object)
{
	//I <3 Math
	gridx = -55. + (110 * cellx);
	object._x = gridx;
	object.cellx = cellx;
}
/**
* Takes object's virtual cell Y coordinate, and moves it to flash grid location
* @param object
* @param celly
* @return gridy
*/
function togridY(celly, object)
{
	//I <3 Math
	gridy = 466.55 - (133.3 * celly);
	object._y = gridy;
	object.celly = celly;
}
/**
* Takes object's flash grid location, and moves it to virtual cell X coordinate
* @param object
* @param gridx
* @return cellx
*/
function tocellX(gridx, object)
{
	//I <3 Math
	cellx = (55 + gridx) / 110;
	cellx = Math.round(cellx);
	object.cellx = cellx;
}
/**
* Takes object's flash grid location, and moves it to virtual cell Y coordinate
* @param object
* @param gridy
* @return celly
*/
function tocellY(gridy, object)
{
	//I <3 Math
	celly = (7 / 2) - ((10 * gridy) / 1333);
	celly = Math.round(celly);
	object.celly = celly;
}
function checkObstacle()
{
	_root.collider = null;
	for (i = 1; i <= _root.obstacles; i++)
	{
		if (_root["obstacle" + i + "x"] == _root.player.cellx and _root["obstacle" + i + "y"] == _root.player.celly)
		{
			ptrace("detected collision with obstacle" + i);
			_root.pauser = true;
			switch (_root["obstacle" + i + "type"])
			{
				case "chain" :
					//chain
					loadMovieNum("CollideChain.swf", 1);
					break;
				case "tv" :
					//tv
					loadMovieNum("CollideTV.swf", 1);
					break;
				case "barrel" :
					//barrell
					loadMovieNum("CollideBox.swf", 1);
					break;

			}
			_root.collider = i;
		}

	}
}
// init _x and _y position for  first cell (top right) plus the counter that sets the name (unique) and left/right and up/down
// borrowed and adapted the dynamic grid from http://www.flashvalley.com/fv_tutorials/creating_a_grid_dynamically/
initX = 0;
initY = 0;
counter = 0;
turn = 1;
_root.resetsafe = true;
_root.iamplayer = 1;//side scroller
_root.opponent = 2;
_root.timer = 1;
_root.timout = 1;
_root.opponentFinding = false;
_root.opponentFound = false;
_root.init = true;
_root.myonemove = true;
_root.pauser = false;
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
		/*grid_container["cell" + counter].onRelease = function()
		{
		ptrace(this._name + " (" + this.cellx + "," + this.celly + ")");
		};*/

		initX += 110;
	}
	initY += 133.30;
	initX = 0;
}
gameTable = new LoadVars();
gameTable.player = _root.iamplayer;
gameTable.sendAndLoad(serverloc + "gengame.php",gameTable,"POST");
gameTable.onLoad = function(success)
{
	_root.game = this.game;
	_root.found = this.found;
	ptrace("game table: " + _root.game);//game table now loaded
	gameInit = new LoadVars();
	gameInit.found = _root.found;
	gameInit.game = _root.game;
	gameInit.player = _root.iamplayer;
	gameInit.sendAndLoad(serverloc + "init.php",gameInit,"POST");
	gameInit.onLoad = function(success)
	{
		_root.obstacles = gameInit.obstacles;
		for (i = 1; i <= _root.obstacles; i++)
		{
			_root["obstacle" + i + "y"] = eval("_root.gameInit.obstacle" + i + "y");
			_root["obstacle" + i + "x"] = eval("_root.gameInit.obstacle" + i + "x");
			switch (eval("_root.gameInit.obstacle" + i + "type"))
			{
				case "1" :
					_root["obstacle" + i + "type"] = "chain";
					break;
				case "2" :
					_root["obstacle" + i + "type"] = "tv";
					break;
				case "3" :
					_root["obstacle" + i + "type"] = "barrel";
					break;
			}
			ptrace(_root["obstacle" + i + "type"]);
			_root.obstacleMC.attachMovie(_root["obstacle" + i + "type"],"obstacle" + i,i);
			togridX(_root["obstacle" + i + "x"],_root.obstacleMC["obstacle" + i]);
			togridY(_root["obstacle" + i + "y"],_root.obstacleMC["obstacle" + i]);
			_root.obstacleMC["obstacle" + i]._yscale = 50;
			_root.obstacleMC["obstacle" + i]._xscale = 50;
		}
		ptrace("Game Table Initialized");//game table now initialized
		sendReceive(false);

	};
};

stop();