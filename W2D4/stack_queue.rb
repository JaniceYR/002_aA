require_relative 'stack'
require_relative 'queue'

class StackQueue

  attr_accessor :push_store, :pop_store

  def initialize
    @push_store = MyStack.new
    @pop_store = MyStack.new
  end

  def enqueue(el)
    @push_store.push(el)
  end

  def dequeue
    until @push_store.empty?
      @pop_store.push(@push_store.pop)
    end

    slink = @pop_store.pop
    @push_store.max, @push_store.min = nil, nil

    until @pop_store.empty?
      @push_store.push(@pop_store.pop)
    end

    slink
  end

  def size
    @push_store.size
  end

  def empty?
    @push_store.empty?
  end

  def min
    @push_store.min
  end

  def max
    @push_store.max
  end
end
