# shutthebox

Shut The Box: Traditional British pub game

This is — for the moment at least — a command line only game.

Compile it with a simple 'go build'.

# How to play?

When you launch the game, three lines are displayed:

```
[1][2][3][4][5][6][7][8][9]
4 6
? 
```

* The first line shows the flaps (they are all up at first)

* The second line shows the dice that have been just rolled

* The third line ask the player what to do

In the example above, the dice are '4' and '6', which totals to 10. So according to the rules of the game, the player can chose to flip down any combination of flaps, provided their sum amounts to 10.

To make a choice, simply enter the flaps you want to flip down in any order, for example: 91 or 82 or 532 or 4321 and hit [ENTER]

Repeat until you run out of possible choices. When you reach this stage, hit 'q' (to quit) and your score will be displayed.

**NOTE:** as if you were playing with a real, wooden Shut The Box game, there is no check of your input. If you want to cheat, you can ;-) If you want to ignore the dices rolled by the computer, you can use real dices etc.

The UI is minimal, in the spirit of BSD games.
