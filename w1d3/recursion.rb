def range_recursive(start_pos, end_pos)
  return [] if end_pos - 1 <= start_pos
  [start_pos + 1] + range_recursive(start_pos + 1, end_pos)
end


def range_iterative(start_pos, end_pos)
  (start_pos + 1...end_pos).to_a
end

# p range_recursive(2, 10)

def sum_recursive(arr)
  return 0 if arr.empty?
  arr.pop + sum_recursive(arr)
end

def sum_iterative(arr)
  sol = 0
  arr.each do |ele|
    sol += ele
  end
  sol
end

#p sum_recursive([1,2,3,4])
#p sum_iterative([1,2,3,4])

def exp(b, n)
  return 1 if n == 0
  b * exp(b, (n - 1))
end

#p exp(3,3)

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n % 2 == 0
    exp2(b, n/2) ** 2
  else
    b * (exp2(b, (n - 1) / 2) ** 2)
  end
end

#p exp2(3,3)
class Array
  def deep_dup
    return self if self.length <= 1
    if self[0].is_a?(Array)
      sol = [self[0].deep_dup]
    else
      sol = [self[0]]
    end
    sol += self[1..-1].deep_dup
    sol
  end
end

# a = [1, [1, 2, 3], [4, 5, 6]]
# b = a.deep_dup
# p a
# p b
#
# b[1] << 9
# p a
# p b

def fibonacci(n)

  return 0 if n <= 0
  return [1] if n == 1
  return [1, 1] if n == 2

  previous = fibonacci(n - 1)
  previous + [previous[-1] + previous[-2]]
end

# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)
# p fibonacci(7)
# p fibonacci(8)

def subsets(arr)
  # sol = [[], arr]

  return [[]] if arr.empty?

  el = arr.pop
  previous = subsets(arr)

  current = previous.map do |ele|
    ele + [el]
  end
  previous + current

end
#
# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)

  leng = arr.length
  return [arr] if leng <= 1
  el = arr.pop
  previous = permutations(arr)
  current, sub_current = [], []
  previous.each do |ele|
    sub_current << ele + [el]
  end
  sub_current.each do |ele|
    leng.times do
      to_shift = ele.deep_dup
      current << to_shift
      ele.rotate!
    end
  end
  current
end


# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]


def bsearch(array, target)
  return nil if array.empty?
  index = array.length / 2
  return index if array[index] == target
  if array[index] < target
    value = bsearch(array[index + 1..-1], target)
    return nil if value.nil?
    index + bsearch(array[index + 1..-1], target) + 1
  else
    bsearch(array[0...index], target)
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length <= 1
  index = arr.length / 2
  left = merge_sort(arr[0...index])
  right = merge_sort(arr[index..-1])
  merge(left, right)
end

def merge(left, right)
  sol = []

  left_idx, right_idx = 0, 0
  while left_idx < left.length && right_idx < right.length
    if left[left_idx] < right[right_idx]
      sol << left[left_idx]
      left_idx += 1
    else
      sol << right[right_idx]
      right_idx += 1
    end
  end

  if left_idx == left.length
    sol += right[right_idx..-1]
  else
    sol += left[left_idx..-1]
  end
  sol
end

# a = [1,2,3,4,5,6,7,8,9].shuffle
# p a
# p merge_sort(a)

def greedy_make_change(amount, coins)
  return [] if amount == 0
  sol = []
  num_coins = amount / coins[0]
  remain = amount - (coins[0] * num_coins)
  num_coins.times { sol << coins[0] }
  coins.shift
  sol + greedy_make_change(remain, coins)
end

# p greedy_make_change(24, [10, 7, 1])

def make_change(amount, coins)
  return [] if amount == 0
  master = []
  coins.each do |coin|
    sol = []
    current_coin = coin
    remain = amount - current_coin
    sol << current_coin
    remain_coins = coins.select do |other_c|
      other_c <= current_coin
      other_c <= remain
    end
    sol += make_change(remain, remain_coins)
    master << sol
  end
  master.sort_by(&:length)[0]
end

p make_change(24, [10, 7, 1])
