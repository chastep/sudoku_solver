# Sudoku

## Learning Competencies

* Model a simple real-world system in Ruby code
* Use Pseudocode effectively to model problem-solving

## Summary

By the end of this challenge you'll have a fully-functioning Sudoku solver that you can run from the command line.

[Sudoku](http://en.wikipedia.org/wiki/Sudoku) is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called "boxes") contains the digits from 1 to 9.

Generally, a puzzle provides a partial solution so that some squares already have numbers.  To solve the puzzle, you fill in the unsolved squares.

![Unsolved](http://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png) ![Solved Sudoku](http://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)


In this challenge, you are presented with 15 unsolved Sudoku puzzles.  The puzzles can be found in the `source/sudoku_puzzles.txt` file.  Five puzzles can be solved with basic logic.  Five require slightly more advanced logic.  Five require educated guessing.  A complete solution will solve all 15 puzzles.


## Releases

### Pre-release

####Modeling: Write down the nouns and verbs of the game

Think carefully about all the nouns and verbs in a Sudoku game. There's the person who created the puzzle (the setter). There's the person who is solving the puzzle (the player). What are the important parts of the board called? How do the player and setting interact with them?

A computer program that solves Sudoku is simulating the *player*, which means the better you can empathize with the player the more likely you'll understand how to write a Sudoku solver. Understanding the person playing the game is key.  What is the player doing when solving a Sudoku puzzle?


#### Modeling: Strategies for Humans

Get out an actual Sudoku puzzle, printed on a piece of paper. Play it with your group. Pay attention to yourself and to each other.

1. What strategies are you adopting and why?
2. How do you choose where to start?
3. How do you know when to really put a number in a square?
4. What do you do when you don't definitively know how to fill in any more squares?

As you reflect on your human strategy, it's important to see that sometimes the strategies that work for humans would be difficult to implement on a computer. And vice versa: strategies we avoid because we'd have to write too much, use too many sheets of paper, or remember too much information are possible for a computer.

#### Modeling: Pseudocode

Before you begin coding, develop and write a pseudocode solution.


### Release 0 : Basic Logic

**Write a Sudoku solver that solves the first five puzzles.**

The first five puzzles can be solved with basic logic: identifying when a square has only one possible value.

#### Details
- You will write a `Sudoku` class, the beginnings of which can be found in the `source/sudoku.rb` file.  Your solver will be an instance of this class; see the driver code provided in the `source/runner.rb` file.


- A solver is instantiated with a `String` representing an unsolved Sudoku board as its argument.  Unsolved squares are marked with a `"-"`.  Solved squares have a character from `"1"` to `"9"`.

  For example ...

  `"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"`

- The `Sudoku` class should have an instance method `#board` that returns the current state of the board in the same format as the argument passed in when instantiating a solver (i.e., an 81-character string).

- The `Sudoku` class should have an instance method `#solve` that attempts to solve the board.  For Release 0, the board should give up, if it gets stuck.


- Be sure to write the `Sudoku#to_s` method, so that you can see what your board looks like after running the `Sudoku#solve` method.  A `#to_s` method determines how an object is represented in string-form; it should return a `String` object, not `puts` anything to the console.

  After defining the `#to_s` method, running the following code ...

  ```ruby
  board = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"

  game = Sudoku.new(board)
  puts game

  ```

  would print something approximating ...

  ```
  1 - 5 8 - 2 - - -
  - 9 - - 7 6 4 - 5
  2 - - 4 - - 8 1 9
  - 1 9 - - 7 3 - 6
  7 6 2 - 8 3 - 9 -
  - - - - 6 1 - 5 -
  - - 7 6 - - - 3 -
  4 3 - - 2 - 5 - 1
  6 - - 3 - 8 9 - -
  ```


### Release 1 :  More Advanced Logic

**Improve your Sudoku solver to solve the next five puzzles.**

Puzzles 6 - 10 can be solved using logic alone but require more than just identifying when a square has only one possible value.

#### Details

- The `Sudoku#solve` method should still give up if it gets stuck.


### Release 2:  Eduated Guessing

**Improve your Sudoku solver to solve all of the puzzles.**

Puzzles 11 - 15 can be solved by making informed guesses about the values of squares and then trying to solve the puzzles based on those guessed values.

#### Details

- Guessing should be started once your `Sudoku#solve` method gets stuck.  In other words, solve as many squares as possible using logic and then start guessing.
