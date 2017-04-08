
def bad_two_sum?(arr, target)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

##### COMPLEXITY: O(n**2) #####

arr = [0, 1, 5, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target)
  arr.each do |el|
    return true if arr.bsearch { |x| x == (target - el) && x != el }
  end
  false
end

##### COMPLEXITY: O(n log n) #####
#
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false


def two_sum?(arr, target)
  hash = Hash.new(nil)

  arr.each do |ele|
    hash[ele] = target - ele
  end

  hash.values.any? do |value|
    hash[value] != nil && hash[value] != value
  end
end

##### COMPLEXITY: O(n) #####

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
