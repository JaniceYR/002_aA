require 'rspec'
require 'hand'
require 'deck'

describe Hand do
  let(:four_of_a_kind) { [Card.new(1, "S"), Card.new(1, "C"), Card.new(1, "H"),
                          Card.new(1, "D"), Card.new(5, "S")]}
  subject(:hand) { Hand.new(four_of_a_kind) }

  describe "#initialize" do
    it 'creates a card instance variable of length 5' do
      expect(hand.cards.length).to eq(5)
    end

    it 'gets five Card object' do
      expect(hand.cards.all? {|card| card.is_a? Card }).to be true
    end
  end

  describe "#score" do
    it 'returns an array of rank and value of rank' do
      expect(hand.score.is_a?(Array)).to be true
    end
    it 'returns an array of Integers' do
      expect(hand.score.all? {|ele| ele.is_a?(Fixnum)}).to be true
    end

    describe "#find_rank" do
      it 'returns 0 when hand gets five of a kind'

      it 'returns 3 when hand is a full house'

      it 'returns 8 when hand is one pair'
    end

    describe "#find_value_of_rank" do
      it 'returns 13 when rank is from the king'

      it 'returns the card from the combination even if there is a larger value'
    end
  end
end
