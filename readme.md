# Welcome to [Yasyf's Cousin Garvey's Den](http://yasyf.github.com/play-/)!

[Visit Homepage To Play](http://garveysden.yasyf.com)


This is a simple turn-based game developed completely using AS 2 and PHP. 

The objective of the game is either to drop cages on an enemy player, trapping him, or to avoid the cages being dropped.

The way this is accomplished is that each game starts with three cages positioned across the center of a 5x3 grid at positions (1,2), (3,2), and (5,2), and a player at (3,2).

On Player 1's turn, he can move his player one square in any 90° direction (up, down, left, right), space permitting

On Player 2's turn, he can move one of his three cages to anywhere on the grid (besides from the location occupied by the other two)

Player 2 will move first.

After both player's have made a move, the turn number increments, and the cages 'fall' one increment towards the ground.

After 7 increments (7 moves EACH), Player 2 will not make a move on the 8th turn, but observe.

Player 1 will make his 8th (final) turn, and then the game will decide the winner.

If the player is trapped, Player 2 wins. If the player escapes, Player 1 wins.

All communication between the two players is done via a PHP API and its connected MySQL Database.

All in-game data is processed independently on either end by AS 2, based on what the API returns.



The API is documented in the file:  [**API.md**](https://github.com/yasyf/play-/blob/master/API.md)

The Todo List is documented in the file:  [**TODO.md**](https://github.com/yasyf/play-/blob/master/TODO.md)

The Grading Scheme is documented in the file: [**Grading.md**](https://github.com/yasyf/play-/blob/master/Grading.md)

The Gameplay Cycle is documented in the file: **Gameplay.txt**

The Commit History is documented in the file: **ChangeLog**

The Commit History (clean) is documented in the file: **COMMITS.LOG**

The Source Files are documented in the folder: **Source**

The Functions is documented in the file: **FUNCTIONS**



## API - php files

accept arguments: `box1y`, `box1x`, `box2y`, `box2x`, `box3y`, `box3x`, `player1y`, `player1x`, `turn`, `player1ready`, `player2ready`





## v1 - flash files

multiplayer framework (ActionScript 2)

play - player one - side scroller

player2 - player two - box dropper



## v2 - flash files

game framework [animation with graphic placeholders]

play - player one - side scroller

player2 - player two - box dropper



## v3 - flash files

game framework combined [animation with both player's objects with graphic placeholders]

play - player one - side scroller with boxes

player2 - player two - box dropper with player



## v4 - flash files

game framework and multiplayer framework integration [with placeholder graphics]

play - player one - side scroller with boxes

player2 - player two - box dropper with player



## v5 - flash files

game framework with actual layout and multiplayer framework integration [with placeholder graphics]

play - player one - side scroller with boxes

player2 - player two - box dropper with player



# *Notes*

-For my sanity, these will be the basic grid of the game. All external backgrounds/surroundings will be a SEPARATE flash file, so that I do not have to recode everything!

-External .as files are not up-to-date or reliable, and should not be referred to except for base framework code.

-ChangeLog is auto generated, and up-to-date since the second-latest commit (HEAD~1).

-For v5, we will not use a coded grid, but a movie clip with the symbol in its correct scale and position, with one frame per cell, so that playing through the movie clip (or going to a certain frame) will show the new position. This is not compatible with animating this move, so a solution must be found (possible using AS within the movie clip, if possible).

-Turns per game: 8