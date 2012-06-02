onClipEvent (enterFrame) {
	_xscale = scalefactor;
	_yscale = scalefactor;
		
		if (_root.resetready)
	{
		_root.resetready = false;
		_root.reset();
	}
	if (_root.timer < 61)
	{
		_root.timer++;
	}
	else
	{
		_root.timer = 0;
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
				if (_root.player1ready == 1)
				{
					_root.timout = 0;
					ptrace("Opponent Not Ready");
					_root.getReady();

				}
				else if (_root.player1ready == 0 and _root.movemade == true)
				{
					
		else
		{
					_root.timout = 0;
					_root.varsSent = false;
					_root.myonemove = true;
					ptrace("Opponent Ready!");
					_root.plusTurn();
					_root.sendReceive(false);

		}


				}
				else if (_root.player1ready == undefined or _root.player1x == undefined or _root.player1y == undefined)
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