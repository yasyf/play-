#API For Garvey's Den

##gengame.php
Generates game table if there is no active one
Accepts arguments: '**player**'

##exit.php
Cleans up table
Accepts arguments: '**game**'

##player1.php
Comunicates with MySQL database for Player 1
Accepts arguments: '**player1x**', '**player1y**', '**player1ready**','**game**'

##player2.php
##Comunicates with MySQL database for Player 2
Accepts arguments: '**box1x**', '**box1y**','**box2x**', '**box2y**','**box3x**', '**box3y**', '**player2ready**','**game**'

##init.php
Initializes the game table
Accepts arguments: '**game**'

##setturn.php
Changes the playerXready of current turn to 1 (ready)
Accepts arguments: '**game**', '**player**'