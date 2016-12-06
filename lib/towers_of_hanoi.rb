class TowersOfHanoi
  attr_accessor :board

  def initialize
    @board = [[3,2,1],[],[]]
  end

  def play
    3.times { move }
  end

  def move(from, to)
    @board[to] << @board[from].pop
  end

  def valid_move?(from, to)
    return false if from == to
    return false if from > 2 || from < 0
    return false if to > 2 || to < 0
    return true if @board[to].empty?
    return false if @board[from].last > @board[to].last
    true
  end

  def won?
    @board[0].empty? && (@board[1].empty? || @board[2].empty?)
  end
end
