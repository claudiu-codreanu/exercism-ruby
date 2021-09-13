=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym

    def self.abbreviate(phrase)

        phrase.split(/\W+/).inject("") do |memo, token|
                memo + token[0].upcase
        end

    end

end