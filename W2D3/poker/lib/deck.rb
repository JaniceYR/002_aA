require_relative 'card'

class Deck
  # SYMBOL = []
  # SUIT = ["\u2660", "\u2665", "\u2666", "\u2663"]
  SUIT = ["S", "H", "D", "C"]

  attr_reader :cards

  def initialize
    set_the_cards

  end

  def shuffle_cards!
    @cards.shuffle!
  end

  private
  def set_the_cards
    @cards = []

    (1..13).each do |symbol|
      (0..3).each do |suit|
        @cards << Card.new(symbol, SUIT[suit])
      end
    end

    shuffle_cards!
  end
end
