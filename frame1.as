function getReady()
{
				_root.getreadybool = false;
			//getready
		getready = new LoadVars();
		getready.game = _root.game;
		getready.player = _root.player;
		getready.turn = _root.turn;
		getready.sendAndLoad("http://direct.yasyf.com/play/getready.php", getready, "POST");
		getready.onLoad = function (success) {
			_root.player2ready = getready.player2ready;
			_root.getreadybool = true;
					trace("player2ready: " + getready.player2ready);
		}
		//getready
}
function checkFound()
{
	_root.opponentFinding = true;
	opponentFoundd = new LoadVars(); 
opponentFoundd.player = _root.player;
opponentFoundd.game = _root.game;
opponentFoundd.sendAndLoad("http://direct.yasyf.com/play/checkgame.php", opponentFoundd, "POST");
opponentFoundd.onLoad = function (success) {
	_root.opponentFound = opponentFoundd.opponentFound;
	trace("Opponent Found:" + _root.opponentFound);
	_root.opponentFinding = false;
											}
											
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
		getx.player = _root.player;
		getx.turn = _root.turn;
		getx.sendAndLoad("http://direct.yasyf.com/play/getx.php", getx, "POST");
		getx.onLoad = function (success) {
			_root.player1x = getx.player1x;
			_root.getxbool = true;
					trace("player1x: " + getx.player1x);
		}
		//getx
		//--
		
		//gety
		gety = new LoadVars();
		gety.game = _root.game;
		gety.player = _root.player;
		gety.turn = _root.turn;
		gety.sendAndLoad("http://direct.yasyf.com/play/gety.php", gety, "POST");
		gety.onLoad = function (success) {
			_root.player1y = gety.player1y;
			_root.getybool = true;
					trace("player1y: " + gety.player1y);
		}
		//gety
		//--
		//getboxx
		getboxx = new LoadVars();
		getboxx.game = _root.game;
		getboxx.player = 2;
		getboxx.turn = _root.turn;
		getboxx.sendAndLoad("http://direct.yasyf.com/play/getx.php", getboxx, "POST");
		getboxx.onLoad = function (success) {
			_root.box1x = getboxx.box1x;
			_root.box2x = getboxx.box2x;
			_root.box3x = getboxx.box3x;
			_root.getboxxbool = true;
					trace("updated boxX");
		}
		//getboxx
		//--
			//--
		//getboxy
		getboxy = new LoadVars();
		getboxy.game = _root.game;
		getboxy.player = 2;
		getboxy.turn = _root.turn;
		getboxy.sendAndLoad("http://direct.yasyf.com/play/gety.php", getboxy, "POST");
		getboxy.onLoad = function (success) {
			_root.box1y = getboxy.box1y;
			_root.box2y = getboxy.box2y;
			_root.box3y = getboxy.box3y;
			_root.getboxybool = true;
					trace("updated boxY");
		}
		//getboxx
		//--

}
function plusTurn()
{
	    setturn = new LoadVars();
		setturn.game = _root.game;
		setturn.player = _root.player;
		setturn.turn = (_root.turn +1);
		setturn.sendAndLoad("http://direct.yasyf.com/play/setturn.php", setturn, "POST");
		setturn.onLoad = function (success) {
			_root.turn ++;
		trace ("Next Turn! (Turn "+ _root.turn+")"); //Next Turn
		_root.getreadybool = false;
			//getready
		getready = new LoadVars();
		getready.game = _root.game;
		getready.player = _root.player;
		getready.turn = _root.turn;
		getready.sendAndLoad("http://direct.yasyf.com/play/getready.php", getready, "POST");
		getready.onLoad = function (success) {
			_root.player2ready = getready.player2ready;
			_root.getreadybool = true;
					trace("player2ready: " + getready.player2ready);
		}
		//getready
		_root.getVars();
		}
}
function exit()
{
	 _root.exiterbool = false;
	exiter = new LoadVars();
	exiter.game = _root.game;
	exiter.sendAndLoad("http://direct.yasyf.com/play/exit.php", exiter, "POST");
	exiter.onLoad = function (success) {
		_root.exiterbool = true;
		trace("exit cleanup done");
	}

}
function sendVars()
{
	   _root.setxbool = false;
	_root.setybool = false;
	_root.setreadybool = false;
	
	   setx = new LoadVars();
		setx.game = _root.game;
		setx.player = _root.player;
		setx.turn = _root.turn;
		setx.player1x = _root.player1x;
		setx.sendAndLoad("http://direct.yasyf.com/play/setx.php", setx, "POST");
		setx.onLoad = function (success) {
			_root.setxbool = true;
		trace ("New X! (X="+setx.player1x+")"); //Next Turn
		}
		
		  sety = new LoadVars();
		sety.game = _root.game;
		sety.player = _root.player;
		sety.turn = _root.turn;
		sety.player1y = _root.player1y;
		sety.sendAndLoad("http://direct.yasyf.com/play/sety.php", sety, "GET");
		sety.onLoad = function (success) {
			_root.setybool = true;
		trace ("New Y! (Y="+sety.player1y+")"); //Next Turn
		}
		setready = new LoadVars();
		setready.game = _root.game;
		setready.player = _root.player;
		setready.turn = _root.turn;
		setready.sendAndLoad("http://direct.yasyf.com/play/setready.php", setready, "POST");
		setready.onLoad = function (success) {
			_root.setreadybool = true;
		trace ("player1ready!"); //Next Turn
		}
}
_root.player = 1; //side scroller
_root.turn = 1;
_root.opponentFinding = false;
_root.opponentFound = false;
_root.loading.embedFonts = false;
gameTable = new LoadVars(); 
gameTable.player = _root.player;
gameTable.sendAndLoad("http://direct.yasyf.com/play/gengame.php", gameTable, "POST");
gameTable.onLoad = function (success) {
            _root.game = this.game;
		trace ("game table: " + _root.game); //game table now loaded
		gameInit = new LoadVars();
		gameInit.game = _root.game;
		gameInit.player = _root.player;
		gameInit.sendAndLoad("http://direct.yasyf.com/play/init.php", gameInit, "POST");
		gameInit.onLoad = function (success) {
		trace ("Game Table Initialized"); //game table now initialized
		getVars();
		getReady();
		
		
		}
} 

stop();