=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram

    def self.isogram?(input)

        !input
          .downcase
          .gsub(/[\s-]/, "")
          .chars
          .sort
          .join
          .match?(/([a-z])\1/)
          
    end

end