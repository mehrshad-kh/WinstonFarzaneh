# Winston Farzaneh

This is the final project of the CE201 Logic Circuits course I took at [Amirkabir University of Technology (Tehran Polytechnic) (AUT)](https://aut.ac.ir/en), 
under professor [Mehdi Sedighi](https://ceit.aut.ac.ir/~msedighi).

It is the hardware implementation of a simple fighting game similar to Mortal Kombat.
The full reference explanation of the project can be found at [docs/Reference.pdf](docs/Reference.pdf).
It's in Persian.

## Explanation

Basically, the game is based around two players, each of which can choose to attack, defend, or move at each turn.
Each player begins with three hearts, and may be located on one of three positions.

[![IMG-5607.jpg](https://i.postimg.cc/W3mbjRWD/IMG-5607.jpg)](https://postimg.cc/mzDGNnGR)

Each player action may be one of the following:
- Move forward
- Move backwards
- Punch
- Kick
- Wait
- Jump

## Implementation

The [CompleteBoard](src/CompleteBoard.v) module has been implemented on a Xilinx Spartan3 FPGA board using Xiling ISE Design Suite.
It makes use of DIP switches for player actions,
LED lights for displaying each player position, 
and two digits of the seven-segment display for each player's health.

## Name

The project is named after two people, 
namely Sir Winston Churchill, 
whose [speech](https://www.forbes.com/sites/geoffloftus/2012/05/09/if-youre-going-through-hell-keep-going-winston-churchill/?sh=47549271d549) 
inspired me to complete the project, and Farzaneh, a Persian girl's name, meaning intelligent.
