require 'pry'

# 1. Come up with requirements/specifications
# 2. Application logic, sequence of steps
# 3. Translation of those steps into code
# 4. Run code to verify logic


# draw a board

# assign player 1 to X
# assign player 2 to O 

# loop until a winner or all squares are taken
# player 1 picks an empty square
# check for a winner
# player 2 picks an empty square
# check for a winner

# if there's a winner
#   show the winner
# or else 
#   it's a tie


def initialize_board
  b = {} # create new hash
  (1..9).each { |position| b[position] = ' '} # go through 1-9 and fill hash b with 1-9 as keys
  b # returns b?
end

def draw_board(b)
  system 'clear'
  puts "#{b[1]} | #{b[2]} | #{b[3]}" 
  puts "-----------"
  puts "#{b[4]} | #{b[5]} | #{b[6]}" 
  puts "-----------"
  puts "#{b[7]} | #{b[8]} | #{b[9]}" 
end

def empty_positions(b)
  b.select {|k, v| v == ' ' }.keys
end

def player_picks_square(b)
  puts "Pick a square (1-9)" 
  position = gets.chomp.to_i # variable "position" is set equal to user input and converted to integer
  b[position] = 'X' # the value corresponding to the key in the b hash that was chosen py userinput and stored in variable called "position" is filled with an 'X'
end

# binding.pry

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end

# def check_winner(b)
#   winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[1,4,7],[2,5,8],[3,6,9],[3,5,7]]
#   winning_lines.each do |line|
#       if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
#         return 'Player'
#       elsif 
#         b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] == 'O'
#         return 'Computer'
#       else
#         return nil
#     end
#   end
# end

def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
    return "Computer" if b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] == 'O'
  end
  nil
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end 