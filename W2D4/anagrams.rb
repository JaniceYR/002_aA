require 'byebug'

def anagramI?(string, target)
  perms = string.chars.permutation.map(&:join)

  perms.include?(target)
end


def anagramII?(string, target)
  str = string.chars
  tar = target.chars

  string.chars.each do |char|
    # debugger
    if tar.include?(char)
      str.delete(char)
      tar.delete(char)
    end
  end

  p string, target

  return true if str.empty? && tar.empty?
  false
end

def anagramIII?(string, target)
  string.chars.sort == target.chars.sort
end

def anagramIV?(string, target)
  letter_count = Hash.new(0)

  string.chars.each { |char| letter_count[char] += 1 }
  target.chars.each { |char| letter_count[char] -= 1 }

  letter_count.values.all? { |value| value == 0 }
end

p anagramIV?("gizmo", "sally")
p anagramIV?("elvis", "lives")
