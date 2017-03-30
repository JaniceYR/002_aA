
def add_numbers(array)
  if array.length <= 1
    array.first
  else
    array.first + add_numbers(array[1..-1])
  end
end

# Test Cases
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil
