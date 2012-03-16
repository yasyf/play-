import mx.transitions.Tween;
import mx.transitions.easing.*;
function sendReceive(ismovemade)
{
_root.sendReceivebool = false;
	variables = new LoadVars();
	variables.game = _root.game;
	variables.turn = _root.turn;
	variables.player1x = _root.player.cellx;
	variables.player1y = _root.player.celly;
	
	variables.sendAndLoad("http://direct.yasyf.com/play/player1.php",variables,"POST");
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
		
		trace("box1x:" + _root.box1x);
		trace("box2x:" + _root.box2x);
		trace("box3x:" + _root.box3x);	
		trace("box1y:" + _root.box1y);
		trace("box2y:" + _root.box2y);
		trace("box3y:" + _root.box3y);
		trace("player2ready: " + variables.player2ready);
		trace("New Y Set! (Y=" + variables.player1y + ")");
		trace("New X Set! (X=" + variables.player1x + ")");
		
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
			trace("recorded move, sent");

		}
	};
}	
	
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
function plusTurn()
{

	_root.setturnbool = false;

	setturn = new LoadVars();
	setturn.game = _root.game;
	setturn.player = _root.iamplayer;
	setturn.turn = _root.turn;
	setturn.sendAndLoad("http://direct.yasyf.com/play/setturn.php",setturn,"POST");
	setturn.onLoad = function(success)
	{
		_root.movemade = false;
		_root.turn++;
		trace("Next Turn! (Turn " + _root.turn + ")");//Next Turn
		_root.setturnbool = true;
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
_root.timer = 1;
_root.timout = 1;
_root.opponentFinding = false;
_root.opponentFound = false;
_root.init = true;
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
		sendReceive(false);

	};
};

stop();