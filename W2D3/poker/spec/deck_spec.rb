require 'rspec'
require 'deck'

describe Deck do
  let(:deck) { Deck.new }
  let(:deck2) { Deck.new }

  describe "#initialize" do
    it 'initializes array of length 52' do
      expect(deck.cards.length).to eq(52)
    end

    it 'initializes array of Card objects' do
      expect(deck.cards.all? { |card| card.is_a?(Card) }).to be true
    end

    it 'shuffles deck' do
      expect(deck.cards == deck2.cards).to be false
    end
  end
end
