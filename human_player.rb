class HumanPlayer < Player

  def get_input(board)
    puts "Where do you want to place your mark? (#{@mark})"
    gets.chomp.split(", ").map(&:to_i)
  end

end
