=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram

    def self.pangram?(sentence)
        sentence
            .downcase
            .gsub(/[^a-z]/, "")
            .chars
            .uniq
            .sort == [*"a".."z"]
    end


    def self.pangram2?(sentence)
        sentence.downcase!

        [*"a".."z"].each do |ch|
            return false if sentence.index(ch).nil?
        end

        return true
    end

end