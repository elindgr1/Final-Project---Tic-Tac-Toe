class Board

  BOARD_MAX_INDEX = 2
  EMPTY_POS = ' '

  def initialize(current_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {
      Array.new(BOARD_MAX_INDEX + 1) {
        EMPTY_POS
      }
    }
  end

  def display
    puts "+- - - - - -+"
    for row in 0..BOARD_MAX_INDEX
      # print has to be used when we don't want to output a line break
      print "| "
      for col in 0..BOARD_MAX_INDEX
        s = @board[row][col]
        if s == EMPTY_POS
          print col + (row * 3) + 1
        else
          print s
        end
        print " | "
      end
      puts "\n+- - - - - -+"
    end
  end

  def board_full
    for row in 0..BOARD_MAX_INDEX
      for col in 0..BOARD_MAX_INDEX
        if @board[row][col] == EMPTY_POS
          return false
        end
      end
    end
    true
  end

  def winner
    winner = winner_cols
    if winner
      return winner
    end
    winner = winner_rows
    if winner
      return winner
    end
    winner = winner_diagonals
    if winner
      winner
    end
  end

  def winner_rows
    0..BOARD_MAX_INDEX.each do |first_symbol|
      first_symbol = @board[row_index][0]
      0..BOARD_MAX_INDEX.each do |col_index|
        if first_symbol != @board[row_index][col_index]
          break
        elsif col_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
    end
  end

  def winner_diagonals
    
  end

end
