class WordIO

  def self.load_words(in_file, &block)
    File.open(in_file, "r") do |f|
      f.each_line { |word| block.call(word.chomp) }
    end
  end

  def self.write_words(out_file, words)
    File.open(out_file, "w") do |f|
      words.each { |word| f.puts word }
    end
  end

end