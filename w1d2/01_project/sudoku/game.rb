require_relative "tile"
require_relative "board"

class Game
  attr_reader :board
  def initialize(filename)
    @board = Board.new(filename)
  end

  def play
    until @board.solved?
      puts "Would you like to guess or erase? g or e?"
      if gets.chomp == "g"
        @board.render
        pos, value = guess

        if @board.validall?(pos, value)
          @board[pos].value = value
          @board.render
          puts "Your answer might work"
        else
          puts "Try again"
        end
      else
        erase
      end
    end
    puts "You completed the puzzle"
  end

  def erase
    puts "Which position would you like to erase?"
    pos = gets.chomp.split(",").map(&:to_i)
    until validpos?(pos)
      puts "You chose an invalid or given position"
      puts "Which position would you like to erase?"
      pos = gets.chomp.split(",").map(&:to_i)
    end
    @board[pos].value = " "
    puts "#{pos} has been erased"
    @board.render
  end

  def guess
    puts "Please choose a pos to fill"
    pos = gets.chomp.split(",").map(&:to_i)
    until validpos?(pos)
      puts "Invalid position given"
      puts "Please choose a pos to fill"
      pos = gets.chomp.split(",").map(&:to_i)
    end

    puts "Please choose a number"
    num = gets.chomp.to_i
    until validnum?(num)
      puts "Invalid number given"
      puts "Please choose a number"
      num = gets.chomp.to_i
    end

    [pos, num]
  end

  def validpos?(pos)
    validnum?(pos[0]) && validnum?(pos[1]) && !@board[pos].given
  end

  def validnum?(num)
    num <= 9 && num >= 0
  end

end

if __FILE__ == $PROGRAM_NAME
  test = Game.new("sudoku1.txt")
  test.play
end
