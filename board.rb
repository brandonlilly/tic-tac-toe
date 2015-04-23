class Board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def won?
    !!winner
  end

  def draw?
    @board.flatten.count(nil) == 0 && !won?
  end

  def winner
    lines = []
    lines += @board
    lines += @board.transpose
    lines << [@board[0][0], @board[1][1], @board[2][2]]
    lines << [@board[0][2], @board[1][1], @board[2][0]]

    lines.each do |row|
      return row.first if row.uniq.length == 1 and !row.first.nil?
    end

    false
  end

  def empty?(pos)
    x, y = pos
    @board[x][y].nil?
  end

  def place_mark(pos, mark)
    x, y = pos
    if empty?(pos)
      @board[x][y] = mark
      true
    else
      false
    end
  end

  def remove_mark(pos)
    x, y = pos
    @board[x][y] = nil
  end


  def render
    str = "╔═══╦═══╦═══╗\n"
    str += @board.transpose.map do |row|
      line = row.map do |cell|
        cell ? cell.to_s.downcase : ' '
      end
      '║ ' + line.join(' ║ ') + " ║\n"
    end.join("╠═══╬═══╬═══╣\n")
    str + "╚═══╩═══╩═══╝\n"
  end

  def display
    puts render
  end

end
