
class Array
  def my_each(&prc)
    index = 0
    while (index < self.length)
      prc.call(self[index])
      index += 1
    end
    self
  end
end
=begin
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]
=end


class Array
  def my_select(&prc)
    selected = []
    self.my_each do |ele|
      selected << ele if prc.call(ele)
    end
    selected
  end
end
=begin
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []
=end
class Array
  def my_reject(&prc)
    selected = []
    self.my_each do |ele|
      selected << ele unless prc.call(ele)
    end
    selected
  end
end
=begin
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
=end

class Array
  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false unless prc.call(ele)
    end
    true
  end
end
=begin
a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true
=end

class Array
  def my_flatten
    elements = []
    self.my_each do |ele|
      if ele.class == Fixnum
        elements << ele
      else
        elements += ele.my_flatten
      end
    end
    elements
  end
end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

class Array
  def my_zip(*args)
    zipped = []

    self.each_with_index do |self_ele, x|
      subzip = [self_ele]
      args.each do |other_ele|
        subzip << other_ele[x]
      end
      zipped << subzip
    end
    zipped

  end
end
=begin
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
=end


class Array
  def my_rotate(num = 1)
    rotated = []
    self.each_with_index do |ele, i|
      rotated[(i - num) % self.length] = ele
    end
    rotated
  end
end
=begin
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
=end


class Array
  def my_join(str = "")
    joined = self[0]
    index = 1
    while (index < self.length)
      joined += str + self[index]
      index += 1
    end
    joined
  end
end

=begin
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"
=end

class Array
  def my_reverse
    reversed = []
    index = self.length-1
    while (index >= 0)
      reversed << self[index]
      index -= 1
    end
    reversed
  end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
