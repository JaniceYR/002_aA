require_relative 'card'

class Board
  attr_reader :board, :width, :length, :unknown, :bombs

  def initialize(num, bombs = 0)
    @board = []
    @bombs = bombs
    populate(num)
    @unknown = []
    set_unknown
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def populate(num)
    @width = ((num + @bombs) ** 0.5).floor
    (1..num/2).each do |num|
      2.times { @board << Card.new(num) }
    end
    @bombs.times {@board << Card.new("B", true)}
    @board.shuffle!
    @board = @board.each_slice(@width).to_a
    @length = @board.length
  end

  def set_unknown
    @board.each_with_index do |row, i|
      row.each_with_index do |card, j|
        @unknown << [i,j]
      end
    end
  end

  def reveal(pos)
    @board[pos].reveal
  end

  def hide(pos)
    @board[pos].hide
  end
end
