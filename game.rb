require_relative 'board.rb'

class Game
  PLAYERS = %w{X O}

  def initialize(starting_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {
      Array.new(BOARD_MAX_INDEX + 1) { EMPTY_POS}
    }
  end
  end

  def play
    print_initial_instruction
    interact_with_human
    play if continue_to_play?
  end

def print_initial_instruction
  puts "Welcome to a Tic-Tac-Toe Game!\nYou are playing against the computer. Try to win."

def continue_to_play?
  print "Would you like to play again? (Y or N): "
  if STDIN.gets.chomp() =~ /Y|y/
    @board = Tic_Tac_Toe.new
    return true
  end
  false
end


  def ask_player_for_move
    if current_player == COMPUTER_PLAYER
      computer_move(current_player)
    else
      human_move(current_player)
    end
  end

  def computer_move(current_player)
    row = -1
    col = -1
    found = "F"

    check_rows(COMPUTER_PLAYER, found)
    check_cols(COMPUTER_PLAYER, found)
    check_diagonals(COMPUTER_PLAYER, found)

    check_rows(HUMAN_PLAYER, found)
    check_cols(HUMAN_PLAYER, found)
    check_diagonals(HUMAN_PLAYER, found)

    if found == "F"
      if @board[1][1] == EMPTY_POS
        row = 1
        col = 1
        @board[row][col] = current_player
      elsif available_corner
        pick_corner(current_player)
      else
        until validate_position(row, col)
          row =  rand(@board.size)
          col = rand (board.size)
        end
        @board[row][col] = current_player
      end
    end
  end

end