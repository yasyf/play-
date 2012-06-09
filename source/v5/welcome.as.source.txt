
onClipEvent(load)
{
p1inst = "- Use the arrow keys to move your player" 
+ newline + "- You have nine turns"
+ newline + "- One direction, one square per turn"
+ newline + "- Your opponent will be moving the falling blocks above you"
+ newline + "- He will move one to any location per turn"
+ newline + "- The blocks will fall closer one increment each turn"
+ newline + "- After the 8th turn, if you are not hit by a landing block, you win!";

 p2inst = "-Use your mouse to drag the blocks around"
+ newline + "-You have nine turns"
+ newline + "-One block per turn"
+ newline + "-Your opponent's will avoid the blocks"
+ newline + "-He will move one direction, one square per turn "
+ newline + "-The blocks will fall down one increment each turn"
+ newline + "-After the 8th turn, if you the player him with a landing block, you win!";

	switch(_level0.iamplayer)
	{
		case 1:
		this.ptext.text = "Player 1"
		this.readme.text = p1inst;
		break;
		case 2:
		this.ptext.text = "Player 2"
		this.readme.text = p2inst;
		break;
	}
}
onClipEvent(mouseUp)
{
	unloadMovieNum(1);
}

