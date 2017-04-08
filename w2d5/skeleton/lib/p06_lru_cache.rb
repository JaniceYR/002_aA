require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map.get(key))
    else
      if count < @max
        calc!(key)
      else
        eject!
        calc!(key)
      end
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    squared = @prc.call(key)
    @store.append(key, squared)
    @map.set(key, @store.last)
    squared
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    val = link.val
    link.remove
    @store.append(link.key, val)
    @map.set(link.key, @store.last)
  end

  def eject!
    debugger
    @map.delete(@store.first.key)
    @store.first.remove
    p @store
  end
end
