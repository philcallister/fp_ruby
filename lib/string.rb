class String

##
# Return n-grams for the String.
#
# n  - The size of the n-grams
#
# rx - The Regex used to split the String
#
# Examples
#
#   'arrows'.ngrams(4)
#   # => ['arro', 'rrow', 'rows']
#
# Returns an Array of n-grams.

  def ngrams(n=2, rx=//)
    ngrams = []
    tokens = self.split(rx)
    max = tokens.length - n
    0.upto(max) do |i|
      token = tokens[i..i+n-1].join
      ngrams << token unless /\d|'/.match(token)
    end
    ngrams
  end

end