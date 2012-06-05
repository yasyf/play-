if (_level0.obstacles != undefined)
{
	
	for (i = 1; i <= _level0.obstacles; i++)
	{
	
		_root.obstacleMC.attachMovie(_level0["obstacle" + i + "type"],"obstacle" + i,i);
		togridX(_level0["obstacle" + i + "x"],_root.obstacleMC["obstacle" + i]);
		togridY(7,_root.obstacleMC["obstacle" + i]);
		_root.obstacleMC["obstacle" + i]._yscale = 20;
		_root.obstacleMC["obstacle" + i]._xscale = 20;
	}
}
function togridX(cellx, object)
{
	//I <3 Math
	gridx = (cellx * 110) - 55;
	object._x = gridx;
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
	gridy = (57 * celly) - 28.5;
	object._y = gridy;

}
initX = 0;
initY = 0;
counter = 0;
//columns
for (i = 7; i >= 1; i--)
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
		if (j == 1)
		{
			grid_container["cell" + counter].cellnumber.text = i;
		}
		if (i == 1)
		{
			grid_container["cell" + counter].cellnumber.text = j;
		}
		
		//when clicked   
		grid_container["cell" + counter].onRelease = function()
		{
			trace(this._name + " (" + this.cellx + "," + this.celly + ")");
		};

		initX += 110;
	}
	initY += 57;
	initX = 0;
}

stop();