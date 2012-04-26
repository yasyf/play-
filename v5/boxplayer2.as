onClipEvent (enterFrame) {
	if (_root.resetsafe)
	{

		_xscale = _root.scalefactor;
		_yscale = _root.scalefactor;
		_root.box3out._x = _x;
		_root.box3out._y = _y;
	}
	if (_root.resetready)
	{
		_root.resetready = false;
		_root.reset();
	}
}
onClipEvent (load) {
	import mx.transitions.Tween;
	import mx.transitions.easing.*;
	initX = 5;
	initY = 2;
	_root.togridX(5,this);
	_root.togridY(2,this);
	_root.box3x = cellx;
	_root.box3y = celly;
	isDragged = false;
	enemy1 = _root.box2out;
	enemy2 = _root.box1out;


}
on (release) {
	if (_root.motion and isDragged)
	{
		this.stopDrag();
		isDragged = false;
		_root.box3x = cellx;
		_root.box3y = celly;
		_root.land(this,enemy1,enemy2);
		if (hit == false)
		{
			_root.myonemove = false;
			_root.varsSent = true;
			_root.sendReceive(true);
		}

	}
}
on (press) {
	if (_root.resetsafe and _root.opponentFound and _root.myonemove)
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