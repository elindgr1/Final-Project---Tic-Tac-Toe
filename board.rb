class Board

  BOARD_MAX_INDEX = 2
  EMPTY_POS = ' '

  def initialize(starting_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {
      Array.new(BOARD_MAX_INDEX + 1) { EMPTY_POS}
    }
  end
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
    # Since we found no open positions, the board is full
    return true
  end

  def winner
    winner = winner_rows()
    if winner
      return winner
    end
    winner = winner_cols()
    if winner
      return winner
    end
    winner = winner_diagnols()
    if winner
      return winner
    end
    # No winners
    return
  end

  def winner_cols
    for col_index in 0..BOARX_MAX_INDEX
      first_symbol = @board[0][col_index]
      for row_index in 1..BOARD_MAX_INDEX
        if first_symbol != @board[row_index][col_index]
          break
        elsif row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
      return
  end

  def winner_rows
    for row_index in 0..BOARD_MAX_INDEX
      first_symbol = @board[row_index][0]
      for col_index in 1..BOARD_MAX_INDEX
        if first_symbol != @board[row_index][col_index]
          break
        elsif col_index == BOARD_MAX_INDEX and first symbol != EMPTY_POS
          return first_symbol
        end
      end
    end
    return
  end

  def winner_diagonals
    first_symbol = @board[0][0]
    for index in 1..BOARD_MAX_INDEX
      if first symbol != @board[index][index]
        break
      elsif index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    first_symbol = @board[0][BOARD_MAX_INDEX]
    row_index = 0
    col_index = BOARD_MAX_INDEX
    while row_index < BOARD_MAX_INDEX
      row_index = row_index + 1
      col_index = col_index - 1
      if first_symbol != @board[row_index][col_index]
        break
      elsif row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    return
  end

  def validate_position(row, col)
    if row <= @board.size and col <= @board.size
      if (@board[row][col] == EMPTY_POS) then
        return true
      else
        puts "That position is occupied."
      end
    else
      puts "Invalid position."
    end
    return false
  end

  def fill_position(row, col, player)
    # implement
  end

end