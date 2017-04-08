class MyStack

  attr_accessor :min, :max

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def push(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def min
    @min
  end

  def max
    @max
  end
end
