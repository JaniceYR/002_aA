require_relative 'card'
require_relative 'board'
require_relative 'humanplayer'
require_relative 'aiplayer'

class Game
  attr_reader :board

  def initialize(num, playernumber = 2, bombs = 0)
    @board = Board.new(num, bombs)
    @players = []
    setplayers(playernumber)
    @currentplayer = @players[0]
  end

  def play
    @currentplayer.render
    sleep(3)
    @board.board.flatten.each{|card| card.visible = false}
    system("clear")
    until won?
      first = getguess
      bomb(first)
      @players.each { |player| player.render(first)}
      second = getguess
      bomb(second)
      @players.each { |player| player.render(second)}
      sleep(1)
      if match?(first, second)
        puts "The cards matched!"
        @currentplayer.score += 1
      else
        puts "The cards did not match!"
        @board[first].hide
        @board[second].hide
        switchplayer
      end
    end
    puts "Game Over"

  end

  def bomb(pos)
    if @board[pos].value == "B"
      puts "YOU OPENED A BOMB. You lose."
      exit
    end
  end

  def getguess
    pos = @currentplayer.guess
    until valid?(pos)
      puts "Invalid guess. Please guess again"
      pos = @currentplayer.guess
    end
    @board[pos].reveal
    pos
  end

  def match?(pos1, pos2)
    @board[pos1].value == @board[pos2].value
  end

  def valid?(guess)
    guess[0] < @board.length && guess[1] < @board.width  && !@board[guess].visible
  end


  def setplayers(playernumber)
    if playernumber == 2
      2.times do
        puts "Please enter the player name"
        @players << HumanPlayer.new(gets.chomp, @board)
      end
    else
      puts "Please enter the player name"
      @players << HumanPlayer.new(gets.chomp, @board)
      @players << AiPlayer.new("AI", @board)
    end
  end

  def won?
    @board.board.flatten.all? { |card| card.visible }
  end

  def switchplayer
    @players.rotate!
    @currentplayer = @players[0]
    puts "It is now #{@currentplayer.name}'s turn"
    system("clear")
  end
end

if __FILE__ == $PROGRAM_NAME
  test = Game.new(2,2,2)
  test.play
end
