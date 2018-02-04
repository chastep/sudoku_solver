# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
	puts board_string
	puts string_to_hash(board_string)
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)

end

# game plan
# ---------
# 

def check_rows(board_string)
	# one_thru_nine = *(1..9)
	board_array = board_str_to_array(board_string)[0..-2]
	puts board_array
end

def string_to_hash(board_string)
	game = {}
	board_string.length.times do |i|
		game[i] = {}
		if board_string[i] == "-"
			game[i][:value] = 0
			game[i][:fixed] = false
		else
			game[i][:value] = board_string[i].to_i
			game[i][:fixed] = true
		end
	end
	game
end

