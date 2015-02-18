require_relative 'board'
require_relative 'player'
require_relative 'human_player'
require_relative 'computer_player'
require 'byebug'

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
  end

  def play
    board = Board.new
    turn = 0

    until board.won? || board.draw?
      board.display

      current_player = @players[turn % 2]

      input = current_player.get_input(board)

      if board.place_mark(input, current_player.mark)
        turn += 1
      else
        puts "That spot is already taken"
      end

    end

    board.display
    puts "Draw." if board.draw?
    puts "Player #{board.winner} won!" if board.won?
  end

end

player1 = HumanPlayer.new("X")
player2 = HumanPlayer.new("O")

game = Game.new(player1, player2)
game.play
