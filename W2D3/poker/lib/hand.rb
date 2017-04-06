require 'card'
require 'byebug'
class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    find_rank
  end

  def score
    # debugger
    [@rank, @value_of_rank]
  end

  def find_rank
    if straight_flush?
      @rank = 1
    elsif four_of_a_kind?
      # debugger
      @rank = 2
      puts "value_of_rank: #{@value_of_rank}"
      puts "rank: #{@rank}"
    elsif full_house?
      @rank = 3
    elsif flush?
      @rank = 4
    elsif straight?
      @rank = 5
    elsif three_of_a_kind?
      @rank = 6
    elsif two_pair?
      @rank = 7
    elsif one_pair?
      @rank = 8
    elsif high_card?
      @rank = 9
    end
  end

  def find_value_of_rank
  end

  def straight_flush?
  end

  def full_house?

  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def one_pair?
  end

  def high_card?
  end

  def four_of_a_kind?
    # every card has the same symbol except for one
    # if it is true? the return true
    # && set the @value of rank inside this mathod.
    card_values = Hash.new{ |h, k| h[k] = 0 }
    selected = []
    @cards.each do |card|
      card_values[card.symbol] += 1
    end

    selected << card_values.select {|k, v| card_values[k] == 4 }

    unless selected.empty?
      @value_of_rank = selected[0].to_a[0][0].to_i


      return true
    end

    false
  end



end
