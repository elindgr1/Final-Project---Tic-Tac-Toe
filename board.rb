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
    puts '+- - - - - -+'
    (0..BOARD_MAX_INDEX).each do |row|
      # print has to be used when we don't want to output a line break
      print '| '
      (0..BOARD_MAX_INDEX).each do |col|
        s = @board[row][col]
        if s == EMPTY_POS
          print col + (row * 3) + 1
        else
          print s
        end
#        print "#{s} | "
        print ' | '
      end
      # notice that double quotes are needed for the newline
      puts "\n+- - - - - -+"
    end
  end

  def board_full
    (0..BOARD_MAX_INDEX).each do |row|
      (0..BOARD_MAX_INDEX).each do |col|
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

  def winner_cols
    (0..BOARD_MAX_INDEX).each do |col_index|
      first_symbol = @board[0][col_index]
      next if first_symbol == EMPTY_POS
      (0..BOARD_MAX_INDEX).each do |row_index|
        if first_symbol != @board[row_index][col_index]
          break
        elsif row_index == BOARD_MAX_INDEX
          return first_symbol
        end
      end
    end
    nil
  end

  def winner_rows
    (0..BOARD_MAX_INDEX).each do |row_index|
      first_symbol = @board[row_index][0]
      next if first_symbol == EMPTY_POS
      (0..BOARD_MAX_INDEX).each do |col_index|
        if first_symbol != @board[row_index][col_index]
          break
        elsif col_index == BOARD_MAX_INDEX
          return first_symbol
        end
      end
    end
    nil
  end

  def winner_diagonals
    first_symbol = @board[0][0]
    unless first_symbol == EMPTY_POS
      (1..BOARD_MAX_INDEX).each do |index|
        if first_symbol != @board[index][index]
          break
        elsif index == BOARD_MAX_INDEX
          return first_symbol
        end
      end
    end
    first_symbol = @board[0][BOARD_MAX_INDEX]
    unless first_symbol == EMPTY_POS
      (0..BOARD_MAX_INDEX).zip(BOARD_MAX_INDEX.downto(0)) do |row_index, col_index|
        if first_symbol != @board[row_index][col_index]
          break
        elsif row_index == BOARD_MAX_INDEX
          first_symbol
        end
      end
    end
    nil
  end

  def ask_player_for_move(current_player)
    played = false
    until played
      puts 'Player ' + current_player + ': Where would you like to play?'
      move = gets.to_i - 1
      col = move % @board.size
      row = (move - col) / @board.size
      if validate_position(row, col)
        @board[row][col] = current_player
        played = true
      end
    end
  end

  def validate_position(row, col)
    if row <= @board.size and col <= @board.size
      if @board[row][col] == EMPTY_POS
        return true
      else
        puts 'Position occupied!'
      end
    else
      puts "Invalid position!"
    end
    false
  end

  def get_next_turn
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
    @current_player
  end

  def next_player
    @current_player == 'X' ? 'O' : 'X'
  end

end
