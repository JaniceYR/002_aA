class HumanPlayer
  attr_reader :name, :board
  attr_accessor :score
  def initialize(name, board)
    @name = name
    @score = 0
    @board = board
  end

  def guess
    render
    puts "Please enter the position of the card"
    puts "Example x,y "
    gets.chomp.split(",").map(&:to_i)
  end

  def render (pos = nil)
    rendered = @board.board.map do |row|
      row.map do |card|
        card.visible ? card.value : "X"
      end
    end
   rendered.each{|row| puts row.join("  ") }
  end
end
