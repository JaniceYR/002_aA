require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(el)
    resize! if @count >= num_buckets
    self[el] << el
    @count += 1
  end

  def remove(el)
    self[el].delete(el)
    @count -= 1
  end

  def include?(el)
    self[el].include?(el)
  end

  private

  def [](el)
    @store[el.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        new_store[ele.hash % num_buckets] << ele
      end
    end
    @store = new_store
  end

end
