require_relative 'board.rb'

# TODO make tictactoe a class, add quit
# TODO move ask_player_for_move to tictactoe
# TODO move get_next_turn to tictactoe


puts 'Starting tic-tac-toe...'
players = %w(X O)
current_player = players[rand(2)]
b = Board.new(current_player)
b.display
puts


puts "Board full: #{b.board_full}"
puts "Winner: #{b.winner}"


until b.board_full or b.winner
  b.ask_player_for_move(current_player)
  current_player = b.get_next_turn
  b.display
  puts
end

if b.winner
  puts 'Player ' + b.get_next_turn + ' wins.'
else
  puts 'Tie Game.'
end
puts 'Game Over'
