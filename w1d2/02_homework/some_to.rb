def sum_to(num)
  if num < 0
    return nil
  elsif num <= 1
    num
  else
    num + sum_to(num-1)
  end
end

# Test Cases
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil
