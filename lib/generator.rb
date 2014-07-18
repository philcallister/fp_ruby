##
# This is a simple generator that takes the required input
# information and generates the required output.
#
# Examples
#
#   Generator.new.process(in_f, q_out_f, a_out_f, true)
class Generator

  attr_accessor :dictionary, :segments

  def initialize
    self.dictionary = Dictionary.new
  end

  ##
  # Everything in the excercise happens within this process sequence.
  #
  # word_in_file - The input file containing the words
  #
  # question_out_file - The output file where questions are written
  #
  # answer_out_file - The output file where answers are written
  #
  # ignore_case - true: ignore case when sorting / false: don't ignore case.
  # I provided this switch as I wasn't sure from the original problem description
  # how sorting should be performed.
  #
  # Examples
  #
  #   Generator.new.process(in_f, q_out_f, a_out_f, true)
  #
  # Returns nothing.
  def process(word_in_file, question_out_file, answer_out_file, ignore_case)
    load_dictionary(word_in_file, ignore_case)
    write_questions(question_out_file)
    write_answers(answer_out_file)
  end

  
  private

  def load_dictionary(word_in_file, ignore_case)
    WordIO.load_words(word_in_file) do |word|
      self.dictionary.add_word(word)
    end
    self.segments = self.dictionary.unique_segments(true, ignore_case)
  end

  def write_questions(question_out_file)
    WordIO.write_words(question_out_file, segments) do |word|
      word.first
    end
  end

  def write_answers(answers_out_file)
    WordIO.write_words(answers_out_file, segments) do |word|
      word.last.first
    end
  end

end