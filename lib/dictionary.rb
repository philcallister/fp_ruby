class Dictionary < Hash

  def add_word(word)
    ngrams = word.ngrams 4
    ngrams.each { |ng| self[ng] = self[ng].nil? ? 1 : self[ng] += 1 }
    self
  end

  def add_words(*words)
    words.each { |w| add_word w }
  end

  def unique
    self.select { |k,v| v == 1 }.keys.sort
  end

end
