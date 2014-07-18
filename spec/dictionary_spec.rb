require "minitest/autorun"
require_relative "../lib/dictionary"

describe "Dictionary" do

  before do
    @dict = Dictionary.new
  end

  describe "#add_word" do

    it "has method defined" do
      Dictionary.method_defined?(:add_word).must_equal true
    end

    it "adds a word and generates 4-grams" do
      @dict.add_word("arrows")
      compare_hash = { "arro"=>1, "rrow"=>1, "rows"=>1 }
      @dict.must_equal compare_hash
    end

    it "adds duplicate words and generates 4-grams with a duplicate count" do
      @dict.add_word("baseball").add_word("football").add_word("ballista")
      @dict["ball"].must_equal 3
    end

    it "won't add 4-grams that include an apostrophe" do
      @dict.add_word("homebrewer's")
      compare_hash = {"home"=>1, "omeb"=>1, "mebr"=>1, "ebre"=>1, "brew"=>1, "rewe"=>1, "ewer"=>1}
      @dict.must_equal compare_hash
    end

    it "won't add 4-grams that include an integer" do
      @dict.add_word("golfer123")
      compare_hash = {"golf"=>1, "olfe"=>1, "lfer"=>1}
      @dict.must_equal compare_hash
    end

  end

  describe "#add_words" do

    it "has method defined" do
      Dictionary.method_defined?(:add_words).must_equal true
    end

    it "adds multiple words and generates 4-grams" do
      @dict.add_words("arrows", "carrots", "give", "me")
      @dict.length.must_equal 7
    end

  end

  describe "#unique" do

    it "has method defined" do
      Dictionary.method_defined?(:unique).must_equal true
    end

    it "adds duplicate words and retrieves unique 4-grams" do
      @dict.add_words("arrows", "carrots", "give", "me")
      @dict.unique.must_equal ["carr", "give", "rots", "rows", "rrot", "rrow"]
    end
  end

end
