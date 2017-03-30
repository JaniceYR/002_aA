require_relative "tile"

class Board
  attr_reader :board

  def initialize(filename)
    loadpuzzle(filename)
  end

  def loadpuzzle(filename)
    @board = File.readlines(filename).map(&:chomp)
    .map{ |row| row.chars.map(&:to_i) }
    set_tiles(@board)
  end

  def set_tiles(board)
    board.map! do |row|
      row.map! do |number|
        number == 0 ? Tile.new(" ", false) : Tile.new(number, true)
      end
    end
  end

  def render
    @board.each_with_index do |row, index|
      puts row.map { |tile| tile.value }.each_slice(3)
        .map{ |three| three.join(" ") }.join("|")
      puts "-" * 17 if index == 2 || index == 5
    end
  end

  def solved?
    validrows?(@board) && validcols?(@board) && validgrids?(@board)
  end

  def validrows?(board)
    num_board = board.map do |row|
      row.map do |tile|
        tile.value
      end
    end
    num_board.all? do |row|
      (1..9).to_a - row == []
    end
  end

  def validcols?(board)
    validrows?(board.transpose)
  end

  def validgrids?(board)
    grid = []
    board.each_slice(3).each do |array|
      grid << array.map { |row| row[0,3] }.reduce(:+)
      grid << array.map { |row| row[3,3] }.reduce(:+)
      grid << array.map { |row| row[6,3] }.reduce(:+)
    end
    validrows?(grid)
  end

  def validall?(pos, value)
    validrow?(pos, value) && validcol?(pos, value) && validcol?(pos, value)
  end

  def validrow?(pos, value)
    !@board[pos[0]].map{|tile| tile.value}.include?(value)
  end

  def validcol?(pos, value)
    @board.each do |row|
      return false if row[pos[1]].value == value
    end
    true
  end

  def validgrid?(pos, value)
    row, col = pos
    row_st = (row / 3) * 3
    col_st = (col / 3) * 3
    grid = @board[row_st, 3].map{|row| row[col_st, 3]}
    !grid.flatten.include?(value)
  end

  def [](pos)
    row,col = pos
    @board[row][col]
  end


end
