require 'byebug'
class ComputerPlayer < Player

  def get_input(board)
    puts "Computer #{@mark} thinking.."
    sleep(1)

    (0..2).each do |x|
      (0..2).each do |y|
        next unless board.empty?([x, y])
        board.place_mark([x, y], @mark)
        won = board.won?
        board.remove_mark([x,y])
        return [x,y] if won
      end
    end


    loop do
      pos = [rand(0..2), rand(0..2)]
      return pos if board.empty?(pos)
    end

  end

end
