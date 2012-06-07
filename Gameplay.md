#Gameplay for Garvey's Den

1. Flash (AS) inits game, requests game table, and inits game table

2. PHP (gengame.php) takes argument for which player, and searches for active table

3. If matching table found (opposite player), returns that table. If not, randomly generates new table, and returns that

4. Flash receives game table name (gameXX) and calls PHP to create and populate it (init.php)

5. Flash (AS) begins game, placing cages at default cell positions of (1,2), (3,2), and (5,2); player placed at (3,2)

6. Flash calls sendReceive() function to verify the databse is in sync, and continues with normal gameplay

7. Player 2 (cage-dropper) goes first, moving one cage to any position on the grif

7. The cages fall one increment, and Player 1 takes his turn, moving the player one square in any right-angle direction (diagonal movement prohibited)

8. This continues back and forth until the 8th turn, with the sendReceive funtion being called after each respective player's move, syncing the position with the database, and making the move on the other player's screen based on a timer syncing with the database, and motion tweens. Positions are used based on the cell location received, using the position functions to turn this into Flash location coordinates.

9. The 7th turn is the last move of Player 2. After Player 1 makes his 7th move, Player 2's Flash passes an 'empty' Turn 8 move to pass the turn

10. Player 1 makes their final (8th) move, and then the winner is calculated on both sides based on a collision test [hitTest()]



##Order of PHP API Calls:



1. gengame.php

2. init.php

3. sendRecive(false)* - timer

4. sendReceive(true)* - after move

5. plusTurn()** - after move

6. exit.php (cleanup; not yet implemented)



*sendReceive() calls either player1.php or player2.php

**plusTurn() calls calls setready.php