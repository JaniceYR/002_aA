require_relative 'stack_queue'
require 'benchmark'

short = (1...1000).to_a.shuffle
mid = (1...100000).to_a.shuffle
long = (1...10000000).to_a.shuffle


def windowed_max_range(array, window_size)
  max_range = nil
  array.each_cons(window_size) do |window|
    max = window.max
    min = window.min
    current = max - min
    max_range = current if max_range.nil? || current > max_range
  end
  max_range
end
start = Time.now
a = (0..5000000).to_a.shuffle
# p windowed_max_range(a, 2) # 4, 8
# p "#First took #{Time.now - start}"

# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def wmr(arr, window)
  slink = StackQueue.new
  max_range = nil

  arr.each do |ele|
    slink.enqueue(ele)
    if slink.push_store.size == window
      curr_range = slink.max - slink.min
      max_range = curr_range if max_range.nil? || curr_range > max_range
      slink.dequeue
    end
  end
  max_range
end

start2 = Time.now
# p wmr(a, 2)
"Second took #{Time.now - start2}"
# p wmr([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p wmr([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p wmr([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def wmr2(arr, window)
  slink = StackQueue.new
  max_range = nil

  arr.each do |ele|
    slink.enqueue(Hash[[:val, ele], [:min, ]])
end

Benchmark.bm do |b|
  b.report("short:    ") { windowed_max_range(short, 5) }
  b.report("medium:   ") { windowed_max_range(mid, 5) }
  b.report("long      ") { windowed_max_range(long, 5) }

end

Benchmark.bm do |b|
  b.report("short:    ") { wmr(short, 5) }
  b.report("medium:   ") { wmr(mid, 5) }
  b.report("long      ") { wmr(long, 5) }

end
