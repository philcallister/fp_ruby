require "minitest/autorun"
require_relative "../lib/generator"
require_relative "../lib/word_io"

Q_OUT = "./spec/output/q.out"
A_OUT = "./spec/output/a.out"

describe "Generator" do

  describe "#process" do

    before do
      Generator.new.process("test_words.txt", Q_OUT, A_OUT, false)  
    end

    after do
      FileUtils.rm A_OUT
      FileUtils.rm Q_OUT
    end

    it "generates the desired output files" do
      File.exist?(Q_OUT).must_equal true
      File.exist?(A_OUT).must_equal true
    end

    it "has the right questions" do
      questions = []
      File.open(Q_OUT, "r") do |f|
        f.each_line { |word| questions << word.chomp }
      end
      questions.must_equal ["carr", "give", "rots", "rows", "rrot", "rrow"]
    end

    it "has the right answers" do
      answers = []
      File.open(A_OUT, "r") do |f|
        f.each_line { |word| answers << word.chomp }
      end
      answers.must_equal ["carrots", "give", "carrots", "arrows", "carrots", "arrows"]
    end

  end

  describe "#process(ignore case=true)" do

    before do
      Generator.new.process("test_words_case.txt", Q_OUT, A_OUT, true)  
    end

    after do
      FileUtils.rm A_OUT
      FileUtils.rm Q_OUT
    end

    it "generates the desired output files" do
      File.exist?(Q_OUT).must_equal true
      File.exist?(A_OUT).must_equal true
    end

    it "has the right questions" do
      questions = []
      File.open(Q_OUT, "r") do |f|
        f.each_line { |word| questions << word.chomp }
      end
      questions.must_equal ["carr", "Give", "rots", "rows", "rrot", "rrow"]
    end

    it "has the right answers" do
      answers = []
      File.open(A_OUT, "r") do |f|
        f.each_line { |word| answers << word.chomp }
      end
      answers.must_equal ["carrots", "Give", "carrots", "arrows", "carrots", "arrows"]
    end

  end
end