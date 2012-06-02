onClipEvent (enterFrame) {
	_xscale = scalefactor;
	_yscale = scalefactor;

	
	if (_root.timer < 61)
	{
		_root.timer++;
	}
	else
	{
		_root.timer = 0;
		if(_level1.lockk == undefined)
		{
			_root.pauser = false;
		}
		else
		{
			_root.pauser = true;
		}
	}

	if (_root.sendReceivebool and _root.exiterbool != true and _root.varsSent != true)
	{
		if (_root.opponentFound == "true" and _root.timer == 60)
		{

			ptrace("opponent found");
			_root.varsSent = true;
			_root.sendReceive(false);


		}
		else
		{



			if (_root.opponentFinding == false and _root.timer == 60)
			{
				ptrace("looking...");
				_root.checkFound();

			}
		}

	}
	if (_root.exiterbool)
	{
		if (_root.abandoned)
		{
			ptrace("opponent left");
		}
		else
		{

			ptrace("game over");

		}

	}
	if (_root.varsSent and _root.exiterbool != true)
	{
		if (_root.sendReceivebool)
		{
			if (_root.getreadybool and _root.timer == 60)
			{
				if (_root.player2ready == 0)
				{
					_root.timout = 0;
					ptrace("Opponent Not Ready");
					_root.getReady();

				}
				else if (_root.player2ready == 1 and _root.movemade == true)
				{
					_root.timout = 0;
					_root.varsSent = false;
					_root.myonemove = true;
					ptrace("Opponent Ready!");
					_root.plusTurn();
					_root.sendReceive(false);




				}
				else if (_root.player2ready == undefined or _root.box2x == undefined or _root.box2y == undefined)
				{
					_root.getReady();
					_root.sendReceive(false);
					_root.timout++;
					ptrace("timeout: " + _root.timout);
					if (_root.timout == 5)
					{

						ptrace("Opponent Left Game!");
						_root.abandoned = true;
						_root.exit();

					}
				}
			}
		}
		else
		{
			if (_root.timer == 60)
			{
				ptrace("Vars have been sent, waiting...");

			}
		}
	}


}
onClipEvent (load) {
	import mx.transitions.Tween;
	import mx.transitions.easing.*;
	_root.togridX(3,_root.player);
	_root.togridY(2,_root.player);
	scalefactor = 100;

}
onClipEvent (keyDown) {
	if (Key.isDown(Key.RIGHT) and cellx <= 4 and !motion and _root.player2ready != 0 and _root.player2ready != undefined and _root.opponentFound and _root.myonemove and !_root.pauser)
	{
		cellx++;
		_root.gridX(cellx,_root.player);
		_root.checkObstacle();
		if (_root.collider != null)
		{
			ptrace("move prohibited");
			cellx--;
			_root.gridX(cellx,_root.player);
		}
		else
		{

			motion = true;
			var tweenRight:Tween = new Tween(this, "_x", Regular.easeOut, _x, gridx, 1, true);
			tweenRight.onMotionFinished = function()
			{
				motion = false;
				_root.myonemove = false;
				_root.varsSent = true;
				_root.sendReceive(true);

			};

		}
	}
	else if (Key.isDown(Key.LEFT) and cellx >= 2 and !motion and _root.player2ready != 0 and _root.player2ready != undefined and _root.opponentFound and _root.myonemove and !_root.pauser)
	{
		cellx--;
		_root.gridX(cellx,_root.player);
		_root.checkObstacle();
		if (_root.collider != null)
		{
			ptrace("move prohibited");
			cellx++;
			_root.gridX(cellx,_root.player);
		}
		else
		{
			motion = true;
			var tweenRight:Tween = new Tween(this, "_x", Regular.easeOut, _x, gridx, 1, true);
			tweenRight.onMotionFinished = function()
			{
				motion = false;
				_root.myonemove = false;
				_root.varsSent = true;
				_root.sendReceive(true);

			};
		}
	}
	else if (Key.isDown(Key.UP) and celly <= 2 and !motion and _root.player2ready != 0 and _root.player2ready != undefined and _root.opponentFound and _root.myonemove and !_root.pauser)
	{
		celly++;
		_root.gridY(celly,_root.player);
		_root.checkObstacle();
		if (_root.collider != null)
		{
			ptrace("move prohibited");
			celly--;
			_root.gridY(celly,_root.player);
		}
		else
		{
			
			motion = true;
			var tweenUp:Tween = new Tween(this, "_y", Regular.easeOut, _y, gridy, 1, true);
			tweenUp.onMotionFinished = function()
			{
				motion = false;
				_root.myonemove = false;
				_root.varsSent = true;
				_root.sendReceive(true);

			};

			/*motion = true;
			var tweenSmall:Tween = new Tween(this, "scalefactor", Strong.easeOut, scalefactor, scalefactor - 55, 1, true);
			tweenSmall.onMotionFinished = function()
			{
			motion = false;
			};*/
		}

	}
	else if (Key.isDown(Key.DOWN) and celly >= 2 and !motion and _root.player2ready != 0 and _root.player2ready != undefined and _root.opponentFound and _root.myonemove and !_root.pauser)
	{
		celly--;
		_root.gridY(celly,_root.player);
		_root.checkObstacle();
		if (_root.collider != null)
		{
			ptrace("move prohibited");
			celly++;
			_root.gridY(celly,_root.player);
		}
		else
		{
			motion = true;
			var tweenDown:Tween = new Tween(this, "_y", Regular.easeOut, _y, gridy, 1, true);
			tweenDown.onMotionFinished = function()
			{
				motion = false;
				_root.myonemove = false;
				_root.varsSent = true;
				_root.sendReceive(true);

			};
			/*motion = true;
			var tweenBig:Tween = new Tween(this, "scalefactor", Strong.easeOut, scalefactor, scalefactor + 55, 1, true);
			tweenBig.onMotionFinished = function()
			{
			motion = false;
			};*/
		}
	}
}