require 'byebug'

def my_min1(arr)
  arr.each do |el1|
    if arr.all? { |el2| el1 <= el2 }
      return el1
    end
  end
end
a = [5,3,8,1,-5,9]
# p my_min1(a)


def my_min2(arr)
  min = nil
  arr.each { |el| min = el if min.nil? || el < min }
  min
end
# p my_min2(a)

def largest_contig_sum(arr)
  sub_arrays = []

  1.upto(arr.length) do |i|
    arr.each_cons(i) do |subarr|
      sub_arrays << subarr
    end
  end

  max = 0
  sub_arrays.each do |sub_arr|
    sum = sub_arr.inject(&:+)
    max = sum if sum > max
  end

  max
end
list = [2, 3, -6, 7, -6, 7]
# p largest_contig_sum(list)

def largest_contig_sum2(arr)
  max = arr.first
  temp = 0
  arr[1..-1].each do |element|
    temp += element
    max = temp if temp > max
    temp = 0 if temp < 0
  end
  max
end
#p largest_contig_sum2(list)
