require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

def get_puzzle_number
	puts "What puzzle(s) would you like to solve today?"
	puts "---------------------------------------------"
	puts "Please enter a number from 1-15"
	input = gets.chomp
	try_again_check(input)
end

def try_again_check(input)
	if (1..15).include?(input.to_i)
		puts "Good to go"
		return input.to_i
	else
		puts "Please try again... (1-15)"
		redo_puzzle_choice = gets.chomp
		try_again_check(redo_puzzle_choice)
	end
end

puzzle_choice = get_puzzle_number - 1

board_string = File.readlines('sudoku_puzzles.txt')[puzzle_choice].chomp

# board_string = File.readlines('sudoku_puzzles.txt')[0]

solved_board = solve(board_string)
if solved?(solved_board)
  puts "The board was solved!"
  puts pretty_board(solved_board)
else
  puts "The board wasn't solved :("
end
