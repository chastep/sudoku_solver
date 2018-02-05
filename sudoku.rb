require_relative "reset_screen"

# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
	puts board_string
	game_hash = string_to_hash(board_string)
	return hash_to_array(brute_force_iterative_solve(game_hash))
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board_array)
	return valid?(board_array) && valid?(board_array.transpose)
end

# method checking all rows for uniqueness
def valid?(board_array)
  board_array.each { |row| return false if row.length != row.uniq.length }
  return true
end

# Brute force iterative solution:
# Starts cursor at zero - runs until end of board
	# if fixed:
		# increments cursor
	# if not fixed:
		# if there's a valid guess in place:
			# increments cursor
		# if value not valid and less than 9:
			# increments guess
		# if no more valid guesses
			# reset current space to 0
			# set cursor back to closest non-fixed position
			# increment guess at that position

def brute_force_iterative_solve(game_hash)
	cursor = 0
	until cursor == 81
		if game_hash[cursor][:fixed]
			cursor += 1
		else
			if verified?(game_hash) && game_hash[cursor][:value] > 0 && game_hash[cursor][:value] <= 9
				cursor += 1
			elsif game_hash[cursor][:value] < 9
				game_hash[cursor][:value] += 1
			elsif game_hash[cursor][:value] >= 9
				game_hash[cursor][:value] = 0
				cursor = prev_guess(game_hash, cursor)
				game_hash[cursor][:value] += 1
			end
		end
		display_current(game_hash)
	end
	return game_hash
end

def verified?(game_hash)
	flat_board = hash_to_flat_array(game_hash)
	return check_rows(flat_board) && check_columns(flat_board) && check_squares(flat_board)
end

# recursive method to find previous unfixed guess and reset cursor
def prev_guess(game_hash, cursor)
	cursor -= 1
	return cursor unless game_hash[cursor][:fixed]
	return prev_guess(game_hash, cursor)
end

# renders the board, pauses
def display_current(game_hash)
	reset_screen
	puts pretty_board(hash_to_array(game_hash))
	sleep(0.001)
end

# game plan
# ---------
# built string maniuplators to help handle board string/format nicely
# have game hash, flat array, and array of rows/columns
# need to check rows, columns, and squares for uniqueness


# validators
# -----------------------------
# this is checking to see if there are any duplicate numbers in the rows
# wont work with zero, checking for numbers 1-9 only
def check_rows(board_array)
	first_row_indexes = [0,1,2,3,4,5,6,7,8]
  current_row = 0
  until current_row >= 9
    indexes = first_row_indexes.map { |i| i + current_row * 9}
    array_of_vals = []
    indexes.each do |i|
    	return false if array_of_vals.include?(board_array[i]) && board_array[i] != 0
    	# return false if array_of_vals.include?(board_array[i])
    	array_of_vals << board_array[i]
    end
    current_row += 1
  end
  return true
end

# same as rows above, but now columns
# this is checking to see if there are any duplicate numbers in the columns
# wont work with zero, checking for numbers 1-9 only
def check_columns(board_array)
	first_column_indexes = [0,9,18,27,36,45,54,63,72]
  current_column = 0
  until current_column >= 9
    indexes = first_column_indexes.map { |i| i + current_column }
    array_of_vals = []
    indexes.each do |i|
    	return false if array_of_vals.include?(board_array[i]) && board_array[i] != 0
    	# return false if array_of_vals.include?(board_array[i])
    	array_of_vals << board_array[i]
    end
    current_column += 1
  end
  return true
end

# same as rows and columns above, but with squares
# this is checking to see if there are any duplicate numbers in the columns
# wont work with zero, checking for numbers 1-9 only
def check_squares(board_array)
	first_square_indexes = [0,1,2,9,10,11,18,19,20]
  current_square = 0
  until current_square >= 3
    indexes = first_square_indexes.map { |i| i + (current_square * 3)}
    array_of_vals = []
    indexes.each do |i|
      return false if array_of_vals.include?(board_array[i]) && board_array[i] != 0
    	# return false if array_of_vals.include?(board_array[i])
    	array_of_vals << board_array[i]
    end
    current_square += 1
  end
  first_square_indexes.map! { |i| i + 27 }
  current_square = 0
  until current_square >= 3
    indexes = first_square_indexes.map { |i| i + (current_square * 3)}
    array_of_vals = []
    indexes.each do |i|
      return false if array_of_vals.include?(board_array[i]) && board_array[i] != 0
    	# return false if array_of_vals.include?(board_array[i])
    	array_of_vals << board_array[i]
    end
    current_square += 1
  end
  first_square_indexes.map! { |i| i + 27 }
  current_square = 0
  until current_square >= 3
    indexes = first_square_indexes.map { |i| i + (current_square * 3)}
    array_of_vals = []
    indexes.each do |i|
      return false if array_of_vals.include?(board_array[i]) && board_array[i] != 0
    	# return false if array_of_vals.include?(board_array[i])
    	array_of_vals << board_array[i]
    end
    current_square += 1
  end
  return true
end

# helpful string manipulators/formats
# -----------------------------
def string_to_hash(board_string)
	game_hash = {}
	81.times do |i|
		game_hash[i] = {}
		if board_string[i] == "-"
			game_hash[i][:value] = 0
			game_hash[i][:fixed] = false
		else
			game_hash[i][:value] = board_string[i].to_i
			game_hash[i][:fixed] = true
		end
	end
	game_hash
end

def hash_to_array(game_hash)
	flat_array = hash_to_flat_array(game_hash)
	board_array = []
	flat_array.each_slice(9) { |row| board_array << row }
	return board_array
end

def hash_to_flat_array(game_hash)
  flat_array = []
  game_hash.values.each do |hash|
  	hash.each { |key, value| flat_array << value if key == :value }
  end
  return flat_array
end

def grid_array(board_array)
	
end

# Board array => print string
def pretty_board(board_array)
	output = "\n"
	board_array.each do |row|
		row.each do |box|
			output << "  #{box}"
		end
		output << "\n"
	end
	output << "\n"
	return output
end