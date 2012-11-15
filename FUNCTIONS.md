#Functions for Garvey's Den

##Functions that are not part of a class:



###gridY(celly, object)   

Takes object's virtual cell Y coordinate, and turns it into flash grid location


param: `object`

param: `celly`

return: `gridy`



###gridX(cellx, object)   

Takes object's virtual cell X coordinate, and turns it into flash grid location


param: `object`

param: `cellx`

return: `gridx`



###land(object, enemy1, enemy2)   

Checks if box is overlapping other box, and if not animates the move


param: `enemy1`

param: `enemy2`

param: `object`

param: `object.hit`



###reset()   

Checks who won the round


param: `box1.cellx`

param: `box1.celly`

param: `box2.cellx`

param: `box2.celly`

param: `box3.cellx`

param: `box3.celly`

param: `player1x`

param: `player1y`

param: `gotya`



###resetBoxes()   

Resets boxes back to original position; resetsafe keeps track of active progress


param: `resetsafe`



###fall()   

Animates one turn's move of falling, resetting if round is over; motion keeps track of active progress


param: `resetready`

param: `motion`

param: `scalefactor`



###togridX(cellx, object)   

Takes object's virtual cell X coordinate, and moves it to flash grid location


param: `object`

param: `cellx`

return: `gridx`



###togridY(celly, object)   

Takes object's virtual cell Y coordinate, and moves it to flash grid location


param: `object`

param: `celly`

return: `gridy`



###tocellX(gridx, object)   

Takes object's flash grid location, and moves it to virtual cell X coordinate


param: `object`

param: `gridx`

return: `cellx`



###tocellY(gridy, object)   

Takes object's flash grid location, and moves it to virtual cell Y coordinate


param: `object`

param: `gridy`

return: `celly`



###samecell(gridx, gridy, object, yfix)   

Check if object has landed in the same cell it started in


param: `object`

param: `gridy`

param: `gridx`

param: `yfix`



###getReady()   

Check with API if other player is ready; getreadybool keeps track of active progress


param: `game`

param: `turn`

param: `player`

param: `getreadybool`



###checkFound()   

Check with API if other player has been found; opponentFinding keeps track of active progress


param: `game`

param: `turn`

param: `player`

param: `opponentFinding`

param: `opponentFoundd`



###plusTurn()   

Increments turn in animation, and relays to API; setturnbool keeps track of active progress


param: `game`

param: `turn`

param: `player`

param: `setturnbool`

param: `box1.scalefactor`

param: `box2.scalefactor`

param: `box3.scalefactor`

param: `player.cellx`

param: `player.celly`

param: `gotya`



###exit()   

Exits game and cleans up table; exiterbool keeps track of active progress


param: `game`

param: `exiterbool`



###sendReceive(ismovemade)   

Send and receive relevant game variables; used for communication with server-side PHP/MySQL API; getreadybool and sendReceivebool keep track of active progress


param: `ismovemade`

param: `game`

param: `turn`

param: `setready`

param: `player1x`

param: `player1y`

param: `box1x`

param: `box1y`

param: `box2x`

param: `box2y`

param: `box3x`

param: `box3y`



###checkObstacle()   

Checks through each obstacle for collision with player's current position


param: `root.obstacles`


