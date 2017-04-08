class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed_array = 0
    self.each_with_index do |el, idx|
      hashed_array += (el.hash % idx.hash)
    end
    hashed_array
  end
end

class String
  def hash
    ### using String hash
    # hashed_string = 0
    # self.chars.each_with_index do |char, idx|
    #   hashed_string += char.ord.hash % idx.hash
    # end
    # hashed_string

    ### using Array hash
    self.chars.map(&:ord).hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashed_hash = 0
    self.each do |key, value|
      hashed_hash += key.hash + value.hash
    end
    hashed_hash
  end
end

class Symbol
  def hash
    hashed_symbol = 0
    self.to_s.chars.each do |char|
      hashed_symbol += (char.ord * 200).hash
    end
    hashed_symbol
  end
end
