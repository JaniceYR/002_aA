require 'rspec'
require 'card'

describe Card do
  let(:card) { Card.new("Q", "H") }
  describe "#initialize" do
    it 'creates cards with symbol' do
      expect(card.symbol).to eq("Q")
    end
    it 'creates cards with suit' do
      expect(card.suit).to eq("H")
    end
  end
end
