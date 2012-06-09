onClipEvent (enterFrame) {
	if (_root.resetsafe)
	{
		
		_xscale = scalefactor;
		_yscale = scalefactor;
		_root.box3out._x = _x;
		_root.box3out._y = _y;
	}
}
onClipEvent (load) {
	import mx.transitions.Tween;
	import mx.transitions.easing.*;
	initX = 5;
	initY = 2;
	_root.togridX(5,this);
	_root.togridY(2,this);
	isDragged = false;
	enemy1 = box2out;
	enemy2 = box1out;
	scalefactor = 35;

}