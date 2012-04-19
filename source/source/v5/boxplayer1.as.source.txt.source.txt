onClipEvent (enterFrame) {
	if (_root.resetsafe)
	{
		_xscale = scalefactor;
		_yscale = scalefactor;
		_root.box1out._x = _x;
		_root.box1out._y = _y;
	}
	

}
onClipEvent (load) {
	import mx.transitions.Tween;
	import mx.transitions.easing.*;
	initX = 1;
	initY = 2;
	_root.togridX(1,this);
	_root.togridY(2,this);
	isDragged = false;
	enemy1 = box2out;
	enemy2 = box3out;
	scalefactor = 35;

}