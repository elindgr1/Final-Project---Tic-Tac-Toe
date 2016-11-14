# CS 1030: Living in a Computing World (aka Computer Science Principles)
_Introductory Programming_
_(Tic-Tac-Toe with Ruby)_

* * *

### Goals

1. Integrate the elements of the Ruby programming language you learned in the tutorial.
2. Gain experience with the implementation of a simple but self-contained computer application.
3. Take your first steps in object-oriented programming and see objects in action.
4. Learn how to use a version-control system and gain experience working with Github.
5. Learn to develop against a test suite. This is called test-driven development (TDD).
6. Learn to work against a requirements list.

### Synopsis



### Submission

You need to submit on the course's chosen learning management system the _URL_ of your remote Github repository by the assignment deadline. 

Once you fork the repository (this is your **remote** repository on Github, aka **origin**), you will clone it to your development machine (this is your local repository), and start work on it. Commit your changes to your local repository often and push them up to the remote repository occasionally. Make sure you push at least once before the due date. At the due date, your remote repository will be cloned and tested automatically by the grading script. _**Note:** Your code should be in the **master** branch of your remote repository._

### Grading

An autograding script will run the test suite against your files. Your grade will be based on the number and weights of the tests passed. (E.g. if your code passes 3 out of 6 test cases, and all weights are equal, your score will be 50% and the grade will be the corresponding letter grade in the course's grading scale). **Note:** The testing and grading will be done with fresh original copies of the test suite files. You are free to modify them during development, but your changes will be discarded. Only your files relevant to the implementation of the requirements (game and computer player) will be used.

### Language

The language is Ruby. At the time of writing, Ruby 2.3.1 is the latest stable version and that will be used to run your code.

### Due date

The assignment is due on **Sun, Dec 4, at 23:55 Mountain time**. The last commit to your _tictactoe_ repository before the deadline will be graded.

### Honor code

You need to use public Github repositories so will be able to look at each other's code. Please, __don't__. You can discuss any programming topics and the assignments in general but sharing solutions diminishes the individual learning experience of others. Assignments might be randomly checked for plagiarism and a plagiarism claim may be raised against you.

You can share all code and solutions within your team, of course.

### Coding style

You are expected to use [RubyMine](https://www.jetbrains.com/ruby/) to develop this project. The IDE adheres (at least partially) to this [style guide](https://github.com/bbatsov/ruby-style-guide). You are encouraged to follow it in general to the best of your ability and time, but especially the [Syntax](https://github.com/bbatsov/ruby-style-guide#syntax) section.

### References



### Detailed Instructions

#### Overall goal

Implement a 2-player tictactoe game on a 3x3 board drawn in ASCII, where players take turns until the game is won by one of the players or the board is full and the game is a tie.

#### Classes and methods

##### class Board

The Board class is implemented in _board.rb_.

The Board class represents the 3x3 board and implements all board-related methods in tictactoe. You are given the following two constants which you should use in your code. The first one indicates the largest index on a 3x3 board (remember that Ruby is *0-indexed*). The other is the *representation of an empty position* on the board. The Board is represented internally as a two-dimensional nexted array.

```ruby
  BOARD_MAX_INDEX = 2
  EMPTY_POS = ' '
```

The `initialize` method is used to set up each new `Board` object. It takes the representation of the `starting_player` as an argument. It has __no default__.
```ruby
  def initialize(starting_player)
    # implement
  end
```

The `display` method is used to have the Board draw itself. 
```ruby
  def display
    # implement
  end
```
An empty board is drawn as follows
```
+- - - - - -+
| 1 | 2 | 3 | 
+- - - - - -+
| 4 | 5 | 6 | 
+- - - - - -+
| 7 | 8 | 9 | 
+- - - - - -+
```
where the numbers are there so players can indicate where they want to move. A board where the two players (assuming the players are represented as 'O' and 'X') have each taken one turn is drawn as follows
```
+- - - - - -+
| 1 | 2 | O | 
+- - - - - -+
| 4 | X | 6 | 
+- - - - - -+
| 7 | 8 | 9 | 
+- - - - - -+
```

The `board_full` method returns `true` if there are no more empty positions and `false` otherwise.
```ruby
  def board_full
    # implement
  end
```

The `winner` method returns `true` if one of the players has constructed a winning combination of 3 consecutive positions and `false` otherwise. Since a winning sequence can be vertical, horizontal, or diagonal, the method calls (is decomposed into) the methods `winner_cols`, `winner_rows`, and `winner_diagonals`. The `winner` method returns the representation of one of the players, if there is a winner, and `nil` otherwise. _Note: Make sure you remember this when implementing the client of this method.
```ruby
  def winner
    # implement
  end

  def winner_cols
    # implement
  end

  def winner_rows
    # implement
  end

  def winner_diagonals
    # implement
  end
```

The `validate_position` method returns `true` if the position represented by the arguments `row` and `col` is empty and valid for the 3x3 board and `false` otherwise. A _negative, zero, or empty_ position is __invalid__. It should return `Position occupied!` if the position is non-empty and `Invalid position!` if the position is invalid. The method does __not__ loop.
```ruby
  def validate_position(row, col)
    # implement
  end
```

The `fill_position` method fills the position represented by the arguments `row` and `col`, if it is __valid__, for the player represented by the `player` argument. The method does __not__ loop.
```ruby
  def fill_position(row, col, player)
    # implement
  end
```

##### class Game

The Game class is implemented in _game.rb_.

The Game class represents (the playing) of one game of tictactoe, using the Board class for all the board-related methods. It implements all the game-related methods, notably the interaction with the two players. The following constant array represents the players.
```ruby
  PLAYERS = %w{X O}
```

The `initialize` method is used to set up each new `Game` object. It takes the representation of the `starting_player` as an argument. It defaults to the `'O'` player.
```ruby
  def initialize(starting_player)
    # implement
  end
```

The `play` method does all the work of playing one game of tictactoe. It should open the game with `Starting tic-tac-toe...`. It should ask the current player where to play. It should call the game with `Player [player] wins.` (using string interpolation) or 'Tie game.' (if the game is tied). Finally, it should conclude every game with `Game over.`.

```ruby
  def play
    # implement
  end
```

The `ask_player_for_move` loops until it gets a valid move from the current player, asking `Player [player]: Where would you like to play?` (using string interpolation). Delegate to the corresponding `Board` method.
```ruby
  def ask_player_for_move
    # implement
  end
```

The `next_player` should alternate the current player, but only when the current player has completed a valid move and the game hasn't ended.
```ruby
  def next_player
    # implement
  end
```

##### The tictactoe.rb file

There is nothing to implement in the _tictactoe.rb_ file. It just creates a new `Game` and calls its `play` method.
