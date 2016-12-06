require 'rspec'
require 'code'

describe 'Array#my_uniq' do
  array = [1, 2, 3, 4, 3, 1, 2].shuffle

  it 'has all unique elements' do
    expect(array.my_uniq.sort).to eq([1, 2, 3, 4])
  end

  it 'should work for an empty array' do
    array = []
    expect(array.my_uniq).to be_empty
  end

  it 'should work for strings' do
    array = ['hi', 'hi', 'bye', 'bye']
    expect(array.my_uniq).to eq(['hi', 'bye'])
  end

  it 'Does not use built-in Array#uniq method' do
    expect(array).not_to receive(:uniq)
    array.my_uniq
  end

end

describe 'Array#two_sum' do

  it 'should work for empty arrays' do
    arr = []
    expect(arr.two_sum).to eq([])
  end

  it 'should work for single pairs' do
    arr = [5, 1, 7, -5]
    expect(arr.two_sum).to eq([[0, 3]])
  end

  context 'it always returns ordered sets of indices' do

    arr = [2, 3, -2, -3, 2]

    it 'does not add the same elements twice' do
      expect(arr.two_sum).to eq([[0, 2], [1, 3], [2, 4]])
    end

    it 'returns ordered sets of indices' do
      expect(arr.two_sum).to eq([[0, 2], [1, 3], [2, 4]])
    end
  end
end

describe "Array#my_transpose" do

  it 'works on an array of length 1' do
    array = [[1]]
    expect(array.my_transpose).to eq([[1]])
  end

  it 'works on an empty array' do
    arr = []
    expect(arr.my_transpose).to eq([])
  end

  it 'it correctly transposes the array' do
    cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  result = [[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]]

  expect(cols.my_transpose).to eq(result)

  end

  it 'Does not call Array#transpose' do
    array = [[1]]
    expect(array).not_to receive(:transpose)
    array.my_transpose
  end
end

describe "#stock_picker" do
 arr = [6, 1, 2, 5, 4, 3, 0]
  it "should pick the best days to buy and sell" do
    expect(stock_picker(arr)).to eq([1, 3])
  end

  it "Should work with negative values" do
    arr = [6, 1, -2, -5, 4, 3, 0]
    expect(stock_picker(arr)).to eq([3,4])
  end


  it "raises error if price on any day is not a fixed number" do
    arr = [1, 2, 3, 4, 5, 6, "Naw"]
    expect { stock_picker(arr) }.to raise_error(ArgumentError)
  end

  it "Does not choose a max that comes before the min" do
    arr = [6, 5, 4, 3, 2, 1, 3]
    expect(stock_picker(arr)).to eq([5, 6])
  end
end
