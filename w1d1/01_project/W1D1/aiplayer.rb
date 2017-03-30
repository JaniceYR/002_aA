class AiPlayer
  attr_reader :name

  def initialize(name, dictionary, num_players)
    @dictionary = dictionary
    @num_players = num_players
    @name = name
  end

  def guess(fragment)
    while true
      char = ("a".."z").to_a.sample
      @dictionary.each do |word|
        return char if word[0..fragment.length] == fragment + char
      end
    end

  end

  def alert_invalid_guess
    puts "invalid play"
  end

end
