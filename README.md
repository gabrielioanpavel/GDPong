# GDPong

The old arcade game 'Pong' recreated using Godot.

## Game modes

* Player vs Player
* Player vs Computer

## How it works

Each time the ball spawns its direction is selected randomly and instantly starts moving. When a player hits it, it gets
reflected and the direction will change based on the player's direction of movement. If the player is moving when hitting
the ball, the latter will get its speed increased. If the player is not moving, then the ball simply reflects and its speed
gets reduced.

The "AI" of the second game mode is super simple, it just follows the ball while on its side of the screen. You win again the
computer by getting the ball to a high enough speed that the opponent can't reach it in time.
