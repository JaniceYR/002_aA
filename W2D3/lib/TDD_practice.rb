class Array
  def my_uniq
    uniques = []
    self.each do |ele|
      uniques << ele unless uniques.include?(ele)
    end
    uniques
  end

  def two_sum
    sum = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        sum << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    sum
  end
end

def my_transpose(array)
  transposed = Array.new(array.length){Array.new(array.length)}
    array.each_index do |x|
      array[x].each_index do |y|
        transposed[y][x] = array[x][y]
      end
    end
  transposed
end


def stock_picker(array)
  raise 'Put array' unless array.is_a?(Array)
  return [] if array.empty?
  best_buy_day = 0
  best_sell_day = 0
  diff = 0

  buy_day = 0
  while buy_day < array.length - 1
    sell_day = buy_day + 1
    while sell_day < array.length
      if array[sell_day] > array[buy_day]
        new_diff = array[sell_day] - array[buy_day]
        if new_diff > diff
          best_buy_day, best_sell_day = buy_day, sell_day
          diff = array[best_sell_day] - array[best_buy_day]
        end
      end
      sell_day += 1
    end
    buy_day += 1
  end
  return [] if diff == 0
  [best_buy_day, best_sell_day]
end
