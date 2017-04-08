class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next unless @prev.nil?
    @next.prev = @prev unless @next.nil?
    @prev = @next = @val = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil? && @tail.nil?
  end

  def get(key)
    link = find_link(key)
    link.val unless link.nil?
  end

  def include?(key)
    link = find_link(key)
    !link.nil?
  end

  def append(key, val)
    if @head.nil?
      @head = @tail = Link.new(key, val)
    else
      prev_tail = @tail
      @tail = Link.new(key, val)
      @tail.prev = prev_tail
      prev_tail.next = @tail
    end
  end

  def update(key, val)
    link = find_link(key)
    link.val = val unless link.nil?
  end

  def remove(key)
    link = find_link(key)
    link.remove unless link.nil?
    link.val
  end

  def each(&prc)
    link = @head
    until link.nil?
      prc.call(link)
      link = link.next
    end
    link
  end

  # uncomment when you have `each` working and `Enumerable` included

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  def [](idx)
    link = @head
    i = 0
    until i == idx
      link = link.next
      i += 1
    end
    link
  end

  private

  def find_link(key)
    link = @head
    until link.nil? || link.key == key
      link = link.next
    end
    link
  end
end
