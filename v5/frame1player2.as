import mx.transitions.Tween;
import mx.transitions.easing.*;
serverloc = "http://site5.yasyf.com/";
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
* Checks if box is overlapping other box, and if not animates the move
* @param enemy1
* @param enemy2
* @param object
* @param object.hit
*/
function land(object, enemy1, enemy2)
{
	if (object.hitTest(enemy1) or object.hitTest(enemy2) or _root.samecell(object._x, object._y, object))
	{

		
		object.hit = true;


	}
	else
	{
		
		object.hit = false;
		_root.tocellX(object._x,object);
		_root.tocellY(object._y,object);

		_root.fall();

	}
	_root.gridX(object.cellx,object);
	var tweenX:Tween = new Tween(object, "_x", Regular.easeOut, object._x, object.gridx, 1, true);
	tweenX.onMotionFinished = function()
	{
		_root.motion = false;
	};
	_root.gridY(object.celly,object);
	var tweenY:Tween = new Tween(object, "_y", Regular.easeOut, object._y, object.gridy, 1, true);
	tweenY.onMotionFinished = function()
	{
		_root.motion = false;
	};
}
/**
* Checks who won the round
* @param box1.cellx
* @param box1.celly
* @param box2.cellx
* @param box2.celly
* @param box3.cellx
* @param box3.celly
* @param player1x
* @param player1y
* @param gotya
*/
function reset()
{
	_root.gotya = false;
	if (_root.box1.cellx == _root.player1x and _root.box1.celly == _root.player1y)
	{
		_root.gotya = true;
	}
	if (_root.box2.cellx == _root.player1x and _root.box2.celly == _root.player1y)
	{
		_root.gotya = true;
	}
	if (_root.box3.cellx == _root.player1x and _root.box3.celly == _root.player1y)
	{
		_root.gotya = true;
	}
	switch (_root.gotya)
	{
		case true :
			for (i; i < 10; i++)
			{
				trace("PLAYER 2 WINS");
			}
			break;
		case false :
			for (i; i < 10; i++)
			{
				trace("PLAYER 1 WINS");
			}
			break;
	}
	_root.resetBoxes();
}
/**
* Resets boxes back to original position; resetsafe keeps track of active progress
* @param resetsafe
*/

function resetBoxes()
{
	_root.resetsafe = false;

	_root.togridX(1,_root.box1);
	_root.togridX(1,_root.box1out);

	_root.togridY(2,_root.box1);
	_root.togridY(2,_root.box1out);

	_root.togridX(3,_root.box2);
	_root.togridX(3,_root.box2out);

	_root.togridY(2,_root.box2);
	_root.togridY(2,_root.box2out);

	_root.togridX(5,_root.box3);
	_root.togridX(5,_root.box3out);

	_root.togridY(2,_root.box3);
	_root.togridY(2,_root.box3out);

	scalefactor = 100;
	_root.resetsafe = true;
}
/**
* Animates one turn's move of falling, resetting if round is over; motion keeps track of active progress
* @param resetready
* @param motion
* @param scalefactor
*/
function fall()
{
	if (_root.resetsafe)
	{

		if (scalefactor > 35)
		{
			_root.motion = true;
			var tweenSmall:Tween = new Tween(this, "scalefactor", Regular.easeOut, scalefactor, scalefactor * .85, 1, true);
			tweenSmall.onMotionFinished = function()
			{

				_root.motion = false;


			};

		}
		else
		{
			_root.motion = true;
			var tweenSmall:Tween = new Tween(this, "scalefactor", Regular.easeOut, scalefactor, 0, 1, true);
			tweenSmall.onMotionFinished = function()
			{

				_root.resetready = true;
				_root.motion = false;

			};


		}

	}
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
/**
* TCheck if object has landed in the same cell it started in
* @param object
* @param gridy
* @param gridx
* @param yfix
*/

function samecell(gridx, gridy, object, yfix)
{
	cellx = (55 + gridx) / 110;
	cellx = Math.round(cellx);
	celly = (7 / 2) - ((10 * gridy) / 1333);
	celly = Math.round(celly);
	if (yfix)
	{
		celly--;
	}
	if (cellx == object.cellx and celly == object.celly)
	{
		return true;
	}
	else
	{
		return false;
	}
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
		_root.player1ready = getready.player1ready;
		_root.getreadybool = true;
		trace("player1ready: " + getready.player1ready);
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
		trace("Opponent Found:" + _root.opponentFound);
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

	setturn = new LoadVars();
	setturn.game = _root.game;
	setturn.player = _root.iamplayer;
	setturn.turn = _root.turn;
	setturn.sendAndLoad(serverloc + "setturn.php",setturn,"POST");
	setturn.onLoad = function(success)
	{
		_root.movemade = false;
		_root.turn++;
		trace("Next Turn! (Turn " + _root.turn + ")");//Next Turn
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
		trace("exit cleanup done");
	};

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

	variables.box2x = _root.box2.cellx;
	variables.box2y = _root.box2.celly;
	variables.box1x = _root.box1.cellx;
	variables.box1y = _root.box1.celly;
	variables.box3x = _root.box3.cellx;
	variables.box3y = _root.box3.celly;



	variables.sendAndLoad(serverloc + "player2.php",variables,"POST");
	variables.onLoad = function(success)
	{
		_root.player1ready = variables.player1ready;
		_root.player1x = variables.player1x;
		_root.player1y = variables.player1y;


		_root.sendReceivebool = true;
		_root.getreadybool = true;

		trace("player1x: " + variables.player1x);
		trace("player1y: " + variables.player1y);
		trace("player1ready: " + variables.player1ready);

		trace("set box1x:" + _root.box1.cellx);
		trace("set box2x:" + _root.box2.cellx);
		trace("set box3x:" + _root.box3.cellx);
		trace("set box1y:" + _root.box1.celly);
		trace("set box2y:" + _root.box2.celly);
		trace("set box3y:" + _root.box3.celly);

		_root.gridX(_root.player1x,_root.player);
		var tweenX:Tween = new Tween(_root.player, "_x", Regular.easeOut, _root.player._x, _root.player.gridx, 1, true);
		_root.gridY(_root.player1y,_root.player);
		var tweenY:Tween = new Tween(_root.player, "_y", Regular.easeOut, _root.player._y, _root.player.gridy, 1, true);

		if (ismovemade)
		{
			_root.movemade = true;
			trace("recorded move, sent");

		}
	};
}



// init _x and _y position for  first cell (top right) plus the counter that sets the name (unique) and left/right and up/down
// borrowed and adapted the dynamic grid from http://www.flashvalley.com/fv_tutorials/creating_a_grid_dynamically/
initX = 0;
initY = 0;
counter = 0;
scalefactor = 100;
resetsafe = true;
turn = 1;
_root.iamplayer = 2;//box-dropper
_root.turn = 1;
_root.timout = 1;
_root.timer = 1;
_root.opponentFinding = false;
_root.opponentFound = false;
_root.init = true;
_root.myonemove = true;
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
gameTable.sendAndLoad(serverloc + "gengame.php",gameTable,"POST");
gameTable.onLoad = function(success)
{
	_root.game = this.game;
	trace("game table: " + _root.game);//game table now loaded
	gameInit = new LoadVars();
	gameInit.game = _root.game;
	gameInit.player = _root.iamplayer;
	gameInit.sendAndLoad(serverloc + "init.php",gameInit,"POST");
	gameInit.onLoad = function(success)
	{
		trace("Game Table Initialized");//game table now initialized
		sendReceive(false);


	};
};

stop();