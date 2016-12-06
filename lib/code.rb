class Array
  def my_uniq
    result = []

    self.each do |el|
      result << el if !result.include?(el)
    end

    result
  end

  def two_sum
    result = []
    self.each_with_index do |el1, idx1|
      self.each_with_index do |el2, idx2|
        result << [idx1, idx2] if el1 + el2 == 0 && idx2 > idx1
      end
    end
    result
  end

  def my_transpose
    result = []
    self.length.times do |i|
      arr = []
      self.each do |row|
        arr << row[i]
      end
      result << arr
    end

    result
  end
end

def stock_picker(arr)
  raise ArgumentError.new if arr.any? { |el| !el.is_a?(Integer) }
  result = []
  profit = 0

  arr.each_with_index do |el, idx|
    next if idx == (arr.length - 1)
    ((idx + 1)..arr.length - 1).each do |idx2|
      temp_profit = arr[idx2] - el
      if  temp_profit > profit
        result = [idx, idx2]
        profit = temp_profit
      end
    end
  end
  result
end
