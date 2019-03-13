# Battleship!

Battleship is a game where two players play on two separate boards and try to sink eachother's battleships. The boards are grids with coordinates and battleships are pieces that occupy one or more spaces on the grid, up to 1 x 5.

The grid is identified in the game with lettered rows and numbered columns. One at a time, each player will call out a position to shoot at the other player's board. If the space is occupied by a battleship, they will make note and on the next turn check an adjacent location to locate the remaining positions of the ship.

A battleship is sunk when the opposing player guesses all grid locations of one of your battleships.

## Implementation

We are going to build a player to player version of this across a network. This will be a two part challenge: you will need to establish a connection with another player and create the game/UI logic.
