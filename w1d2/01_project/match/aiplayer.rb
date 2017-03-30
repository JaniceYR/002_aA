class AiPlayer
  attr_reader :name, :board
  attr_accessor :score

  def initialize(name = "AI", board)
    @name = name
    @score = 0
    @board = board
    @known = Hash.new { |h, k| h[k] = [] }
  end

  def guess
    pos = chooseguess
    puts "AI player has chosen position #{pos}"
    pos
  end

  def chooseguess
    @known.each do |value, positions|
      if positions.length == 2 && invisible(positions)
        return invisible(positions)
      end
    end
    @board.unknown.sample
  end

  def invisible(poses)
    return poses[0] if !@board[poses[0]].visible
    return poses[1] if !@board[poses[1]].visible
    false
  end

  def render(pos)
    @known[@board[pos].value] << pos
    @known[@board[pos].value].uniq!
    @board.unknown.delete(pos)
  end
end
