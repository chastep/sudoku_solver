# Sudoku 1 Modeling Logic

##Learning Competencies

* Model a simple real-world procedure in Ruby.
* Use Pseudocode to model 

##Summary

By the end of the next two challenges you'll have a fully-functioning Sudoku solver that you can run from the command line.

[Sudoku](http://en.wikipedia.org/wiki/Sudoku) is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called "boxes") contains all of the digits from 1 to 9.

The person who created the puzzle provides a partial solution so that some squares already have numbers. Typically, there are enough initial numbers to guarantee a unique solution.

![Unsolved](http://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)

![Solved Sudoku](http://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

For the first iteration, we're just going build a solver that fills in "logically necessary" squares and requires no guessing.

##Releases

###Release 0 : Modeling

####Modeling: Write down the nouns and verbs of the game

Think carefully about all the nouns and verbs in a Sudoku game. There's the person who created the puzzle (the setter). There's the person who is solving the puzzle (the player). What are the important parts of the board called? How do the player and setting interact with them?

A computer program that solves Sudoku is simulating the *player*, which means the better you can empathize with the player the more likely you'll understand how to write a Sudoku solver. You'll be tempted to focus on the board first—is it some kind of array, a hash, something else?—but don't! Understanding the person playing the game is key, the code to "power" the board is a detail.

#### Modeling: Strategies for Humans

Get out an actual Sudoku puzzle, printed on a piece of paper. Play it with your pair. Pay attention to yourself and to each other.

1. What strategies are you adopting and why?
2. How do you choose where to start?
3. How do you know when to really put a number in a cell?
4. Did you adopt the same notation/board markings while playing Sudoku? Why? If not, why did you choose differently?
5. Are you avoiding any strategies because they're too tedious or require you to remember too much?

It's important to see that sometimes the strategies that work for us (humans) would be really hard to implement on a computer, and vice versa: strategies we avoid because we'd have to write too much, use too many sheets of paper, or remember too much are a cakewalk for a computer.

#### Modeling: Pseudocode for First Iteration

Remember, for the first iteration, we're just going build a solver that fills in "logically necessary" squares and requires no guessing. This might not solve every Sudoku board, although it often solves the easiest. How can you tell when you've filled in all the "logically necessary" squares?

Write out pseudocode for this version, separately, and compare it to each other. How does it differ? Which approach seems more sound? Are there some core operations or methods you need to support?

For example, given a cell/square, you'll probably need at least three methods:

1. Give me the other cells in that cell's row.
2. Give me the other cells in that cell's column.
3. Give me the other cells in that cell's box.

###Release 1 :  Code it up!

Your Sudoku solver should take a string like this as its input:

```text
619030040270061008000047621486302079000014580031009060005720806320106057160400030
```

Each consecutive 9 digits represents a row of the Sudoku board, and a `0` represents an empty cell. It'd work like this:

```ruby
game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')

game.solve!

puts game.board
```

This would print something like this:

```text
---------------------
4 8 3 | 9 2 1 | 6 5 7
9 6 7 | 3 4 5 | 8 2 1
2 5 1 | 8 7 6 | 4 9 3
---------------------
5 4 8 | 1 3 2 | 9 7 6
7 2 9 | 5 6 4 | 1 3 8
1 3 6 | 7 9 8 | 2 4 5
---------------------
3 7 2 | 6 8 9 | 5 1 4
8 1 4 | 2 5 3 | 7 6 9
6 9 5 | 4 1 7 | 3 8 2
---------------------
```

Again, **note**, this first iteration might not solve every possible Sudoku board. This means it would finish when it can no longer make a choice and "give up." We'll create the fully-featured version in the next challenge.

Don't worry about the particular format of the board when printed. The key thing is getting the logic around solving/guessing correctly.

#### What about performance?

Do *not* worry about performance yet! Optimizations can come later. Clean, logical code is more important and will be easier to refactor.

###Release 2 : Testing!

Remember, always start with the simplest test case possible. For a Sudoku solver, what's the simplest case? (Besides being passed an already-solved board.) Working with a board that is only missing one number.

```
609238745274561398853947621486352179792614583531879264945723816328196457167485932
```

<!-- ##Optimize Your Learning -->

##Resources
