=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase

    def initialize(phrase)
        @phrase = phrase
    end

    def word_count_old
        hash = {}

        @phrase
            .downcase
            .scan(/'\w+'|\w+'\w+|\w+/)
            .map {|word| word.chars.first == "'" && word.chars.last == "'" ? word[1..-2] : word}
            .each {|word| hash[word] = (hash[word] || 0) + 1}

        hash
    end

    def word_count

        @phrase
            .downcase
            .scan(/'\w+'|\w+'\w+|\w+/)
            .map {|word| word.chars.first == "'" && word.chars.last == "'" ? word[1..-2] : word}
            .tally

    end

end