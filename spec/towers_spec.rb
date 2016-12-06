require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do

  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do

    it "should set a new board" do
        expect(game.board).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    it "should accept 2 parameters" do
      expect { game.move(0, 1) }.not_to raise_error
    end

    it 'should modify the board correctly' do
      game.move(0, 1)
      expect(game.board).to eq([[3, 2], [1], []])
    end
  end

  describe "#won?" do

    it 'returns true if game is over' do
      game.board = [[], [3, 2, 1], []]
      expect(game.won?).to eq(true)
    end
    it 'returns false if game is not over' do
      game.board = [[3, 2, 1],[],[]]
      expect(game.won?).to eq(false)

      game.board = [[3, 2],[1],[]]
      expect(game.won?).to eq(false)
    end
  end

  describe '#valid_move?' do

    it 'should check if from and to are on the board' do
      game.board = [[3, 2, 1],[], []]
      expect(game.valid_move?(5, 5)).to eq(false)
    end

    it 'should check if the from pile and to pile are different' do
      game.board = [[3, 2, 1],[], []]
      expect(game.valid_move?(0, 0)).to eq(false)
    end

    it 'should return false if move is invalid' do
      game.board = [[3, 2],[1], []]
      expect(game.valid_move?(0, 1)).to eq(false)
    end

    it 'should return true if move is valid' do
      expect(game.valid_move?(0, 1)).to eq(true)
    end
  end
end
