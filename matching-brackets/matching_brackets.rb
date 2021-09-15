=begin
Write your code for the 'Matching Brackets' exercise in this file. Make the tests in
`matching_brackets_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matching-brackets` directory.
=end

class Brackets

    def self.paired?(s)
        stack = []

        s.chars.each do |ch|
            case ch

            when "(", "[", "{"
                stack.push(ch)

            when ")"
                return false if stack.pop != "("

            when "]"
                return false if stack.pop != "["

            when "}"
                return false if stack.pop != "{"

            end
        end

        return stack.empty?
    end

end