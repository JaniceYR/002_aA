require_relative "player"
require_relative "aiplayer"

class Game
#  attr_reader :player1, :player2, :fragment, :dictionary

  def initialize(num_players = 2, num_ai = 0)
    @dictionary = File.readlines("dictionary.txt").map {|line| line.chomp}
    @losses = Hash.new(0)
    @players = initialize_players(num_players) + initialize_ais(num_ai, num_players)
    @current_player = @players[0]
    @previous_player = nil
    @fragment = ""
  end

  def run
    until game_over?
      play_round
    end
  end

  def play_round
    until round_over?
      take_turn(@current_player)
    end
    @losses[@previous_player] += 1
    @players.each do |player|
      puts "#{player.name} : #{record(player)}"
    end
    @fragment = ""
  end

  def initialize_players(num_players)
    players = []
    num_players.times do |i|
      puts "enter player #{i+1} name"
      players << Player.new(gets.chomp)
    end
    players.each do |player|
      @losses[player] = 0
    end
    players
  end

  def initialize_ais(num_ai, num_players)
    ais = []
    num_ai.times do |i|
      ais << AiPlayer.new("Computer #{i + 1}", @dictionary, num_players + num_ai)
    end
    ais.each do |ai|
      @losses[ai] = 0
    end
    ais
  end

  def next_player!
    next_index = (@players.find_index(@current_player) + 1) % @players.length
    @previous_player = @current_player
    @current_player = @players[next_index]
  end

  def take_turn(player)
    while true
      puts "Fragment : #{@fragment}"
      input = player.guess(@fragment)
      if valid_play?(input)
        break
      end
      player.alert_invalid_guess
    end
    @fragment += input
    next_player!
  end

  def valid_play?(char)
    check_list = ("a".."z").to_a
    unless check_list.include?(char)
      puts "in alphabet"
      return false
    end
    @dictionary.each do |word|
      return true if word[0..@fragment.length] == @fragment + char
    end
    false
  end

  def record(player)
    ghost = "GHOST"
    ghost[0...@losses[player]]
  end

  def round_over?
    @dictionary.each do |word|
      return true if word == @fragment
    end
    false
  end

  def game_over?
    @players.each do |player|
      return true if @losses[player] == 5
    end
    false
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new(0,3).run
end
