=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn

    def Luhn.valid?(s)
        s.gsub!(/\s/, "")                   # remove spaces

        return false if s.match?(/[^\d]/)   # check for non-digits
        return false if s.length < 2        # check for length

        s.chars
          .map {|ch| ch.to_i}
          .reverse
          .each_with_index
          .map {|d, i| i.even? ? d : d * 2}
          .map {|n| n > 9 ? n - 9 : n}
          .sum % 10 == 0
    end

end