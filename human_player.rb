class HumanPlayer < Player

  def get_input(board)
    puts "Player #{@mark}, it is your turn."
    gets.chomp.split(", ").map(&:to_i)
  end

end
