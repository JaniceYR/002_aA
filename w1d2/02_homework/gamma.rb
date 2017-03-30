def gamma_fnc(num)
  if num <= 0
    return nil
  elsif num == 1
    return 1
  else
    (num - 1) * gamma_fnc(num -1)
  end

end

# Test Cases
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
