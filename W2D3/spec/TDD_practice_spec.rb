require 'rspec'
require 'TDD_practice.rb'

describe "#my_uniq" do
  it 'return empty when it gets empty array' do
    expect([].my_uniq).to be_empty
  end
  it 'return unique array when it gets unique array' do
    expect([1, 2, 3].my_uniq).to eq([1, 2, 3])
  end
  it 'return unique array when it gets array with duplicate' do
    expect([1, 1, 2, 2, 3, 1].my_uniq).to eq([1, 2, 3])
  end
end

describe "#two_sum" do
  let(:example_array) { [-1, 0, 2, -2, 1] }
  let(:example_array2) { [-1, 1, 1, -3, -3, 3] }

  it 'returns empty array when there is no element' do
    expect([].two_sum).to be_empty
  end

  it 'returns array with indices of pairs that zero sum' do
    expect(example_array.two_sum).to eq([[0, 4], [2, 3]])
  end

  it 'returns array with smaller elements first' do
    expect(example_array2.two_sum).to eq([[0, 1], [0, 2], [3, 5], [4,5]])
  end
end

describe "#my_transpose" do
  it 'return empty when it gets empty array' do
    expect(my_transpose([])).to be_empty
  end

  it 'return self when it gets 1 * 1 array' do
    expect(my_transpose([[2]])).to eq([[2]])
  end

  it 'return correctly 3 * 3 transposed array' do
    expect(my_transpose([
                        [0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8]
                        ])).to eq([
                                  [0, 3, 6],
                                  [1, 4, 7],
                                  [2, 5, 8]
                                  ])
  end


end


describe "#stock_picker" do
  it 'raises error unless the input is an array' do
    expect { stock_picker(1) }.to raise_error('Put array')
  end

  it 'returns an empty array when called with an empty array' do
    expect(stock_picker([])).to be_empty
  end

  it 'doesn\'t sell before buying for increasing prices' do
    expect(stock_picker([1, 3, 5, 6, 8])).to eq([0, 4])
  end

  it 'returns the empty array when prices keep decreasing' do
    expect(stock_picker([8, 6, 5, 3, 1])).to be_empty
  end

  it 'returns the most profitable pair' do
    expect(stock_picker([6, 4, 1, 3, 2])).to eq([2, 3])
  end
end
