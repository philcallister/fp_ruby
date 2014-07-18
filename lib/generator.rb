class Generator

  attr_accessor :dictionary

  def initialize
    self.dictionary = Dictionary.new
  end

  def process(word_in_file, question_out_file, answer_out_file)
    load_dictionary(word_in_file)
    write_questions(question_out_file)
  end

  
  private

  def load_dictionary(word_in_file)
    WordIO.load_words(word_in_file) do |word|
      self.dictionary.add_word(word)
    end
  end

  def write_questions(question_out_file)
    WordIO.write_words(question_out_file, self.dictionary.unique)
  end

end