onClipEvent (enterFrame) {
	if (_root.resetsafe)
	{

		_xscale = _root.scalefactor;
		_yscale = _root.scalefactor;
		_root.box2out._x = _x;
		_root.box2out._y = _y;
	}

}
onClipEvent (load) {
	import mx.transitions.Tween;
	import mx.transitions.easing.*;
	initX = 3;
	initY = 2;
	_root.togridX(3,this);
	_root.togridY(2,this);
	_root.box2x = cellx;
	_root.box2y = celly;
	isDragged = false;
	enemy1 = _root.box1out;
	enemy2 = _root.box3out;


}
on (release) {
	if (_root.motion and isDragged)
	{
		_root.tempstop = true;
		this.stopDrag();
		isDragged = false;
		_root.myonemove = false;
		_root.box2x = cellx;
		_root.box2y = celly;
		_root.land(this,enemy1,enemy2);
		if (hit == false)
		{
			
			_root.myonemove = false;
			_root.varsSent = true;
			_root.sendReceive(true);
		}
		else
		{
			_root.tempstop = false;
			_root.myonemove = true;
		}


	}
}
on (press) {
	if (_root.resetsafe and _root.opponentFound and _root.myonemove and !_root.tempstop)
	{

		_root.currentBox = this;

		if (!_root.motion and _root.player1ready != 1 and _root.player1ready != undefined)
		{

			this.startDrag();
			isDragged = true;
			_root.motion = true;

		}
	}

}