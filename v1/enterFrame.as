onClipEvent (enterFrame) {
	if(_root.timer < 61)
	{
		_root.timer ++;
	}
	else
	{
		_root.timer = 13;
	}
	if (_root.getxbool and _root.getybool and _root.getreadybool and _root.getboxxbool and _root.getboxybool and _root.exiterbool != true and _root.varsSent != true)
	{
		if (_root.opponentFound == "true")
		{

			_root.loading.loading.text = "Done!";
			_root.nextOut.nextIn.text = "Next Turn";

		}
		else
		{

			_root.loading.loading.text = "Looking...";
			_root.nextOut.nextIn.text = "";
			if (_root.opponentFinding == false and _root.timer == 60)
			{
				_root.checkFound();
			}
		}

	}
	if (_root.exiterbool)
	{
		if (_root.abandoned)
		{
			_root.loading.loading.text = "Opponent Left";
			_root.nextOut.nextIn.text = "";
		}
		else
		{

			_root.loading.loading.text = "Game Over";
			_root.nextOut.nextIn.text = "";

		}

	}
	if (_root.varsSent and _root.exiterbool != true)
	{
		if (_root.setxbool and _root.setybool and _root.setreadybool)
		{
			if (_root.getreadybool and _root.timer == 60)
			{
				if (_root.player2ready == 0)
				{
					trace("Opponent Not Ready");
					_root.loading.loading.text = "Waiting...";
					_root.nextOut.nextIn.text = "";
					_root.getReady();

				}
				else if (_root.player2ready == 1)
				{
					_root.varsSent = false;
					trace("Opponent Ready!");
					_root.loading.loading.text = "Ready!";
					_root.nextOut.nextIn.text = "Playing...";
					_root.plusTurn();


				}
				else
				{
					_root.timout++;
					trace("timeout: " + _root.timout);
					if (_root.timout == 5)
					{

						trace("Opponent Left Game!");
						_root.abandoned = true;
						_root.loading.loading.text = "Opponent Left";
						_root.nextOut.nextIn.text = "";
						_root.exit();

					}
				}
			}
		}
		else
		{
			if (_root.timer == 60)
			{
				trace("Vars have been sent, waiting...");

			}
		}
	}

}