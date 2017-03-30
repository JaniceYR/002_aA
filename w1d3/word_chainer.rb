class WordChainer

  def initialize(filename)
    @dictionary = File.readlines(filename).map(&:chomp)
  end

  def adjacent_words(word)
    same_size_words = @dictionary.select do |w|
      w.length == word.length
    end
    adjacent = same_size_words.select do |w|
      dif = 0
      w.split("").each_with_index do |char, i|
        dif += 1 if char != word[i]
      end
      dif == 1
    end
    adjacent
  end

  def explore_current_words(w, new_current_words)

    adjacent_words(w).each do |adj_word|
      next if @all_seen_words.include?(adj_word)
      new_current_words << adj_word
      @all_seen_words[adj_word] = w
    end
    # @all_seen_words.each do |key, val|
    #   puts "Word #{key} came from #{val}"
    # end
    new_current_words
  end

  def build_path(target_word)
    sol = []
    sol << @all_seen_words[target_word]
    until @all_seen_words[sol[-1]].nil?
      sol << @all_seen_words[sol[-1]]
    end
    sol.reverse!
    sol << target_word
    puts sol

  end

  def run(source_word, target_word)
    @current_words = [source_word]
    @all_seen_words = { source_word => nil }

    until @current_words.empty?
      new_current_words = []
      @current_words.each do |w|
        new_current_words = explore_current_words(w, new_current_words)
      end
      # puts new_current_words
      @current_words = new_current_words
    end
    build_path(target_word)
  end

end


t = WordChainer.new("dictionary.txt")
t.run("duck","ruby")
