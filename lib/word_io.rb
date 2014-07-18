##
# WordIO is a simple class used to read words from an input
# file and write questions/answers to an output file.
#
# Examples
#
#   WordIO.load_words(words_in_file) do |word|
#     puts word
#   end
#
#   WordIO.write_words(questions_out_file, segments) do |word|
#     word.reverse
#   end
class WordIO

  ##
  # Read words from the given input file. For each word,
  # the given block is called for processing. 
  #
  # in_file - The input file containing the words.
  #
  # block - This block gets called for each word that's read.
  #
  # Examples
  #
  #   WordIO.load_words(words_in_file) do |word|
  #     puts word
  #   end
  #
  # Returns nothing.
  def self.load_words(in_file, &block)
    File.open(in_file, "r") do |f|
      f.each_line { |word| block.call(word.chomp) }
    end
  end

  ##
  # Write the given words to the given output file. For each word,
  # the given block is called for any additional processing. 
  #
  # out_file - Write the given works to this output file.
  #
  # words - Array of words to be written.
  #
  # block - This block gets called for each word that needs to be written.
  # The block allows for lazy-processing of the array so that pre-processing
  # isn't necessary.
  #
  # Examples
  #
  #   WordIO.write_words(answers_out_file, words) do |word|
  #     word.reverse
  #   end
  #
  # Returns nothing.
  def self.write_words(out_file, words, &block)
    File.open(out_file, "w") do |f|
      words.each { |word| f.puts block.call(word) }
    end
  end

end