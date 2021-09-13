=begin
Write your code for the 'Roman Numerals' exercise in this file. Make the tests in
`roman_numerals_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/roman-numerals` directory.
=end

class Integer

    @@roman_symbols = [
        {one: "I", five: "V", ten: "X"},
        {one: "X", five: "L", ten: "C"},
        {one: "C", five: "D", ten: "M"},
        {one: "M", five: "", ten: ""}
    ]

    def to_roman
        self
            .to_s
            .rjust(4, "0")
            .chars[0..3]
            .map {|ch| ch.to_i}
            .zip([3, 2, 1, 0])
            .map {|(d, pow)| self.digit_to_roman(d, pow)}
            .join
    end

private

    def digit_to_roman(d, power_of_ten)
        romans = @@roman_symbols[power_of_ten]

        case d

        when 0
            return ""

        when 1..3
            return romans[:one] * d

        when 4
            return "#{romans[:one]}#{romans[:five]}"

        when 5
            return romans[:five]

        when 6..8
            return "#{romans[:five]}#{romans[:one] * (d - 5)}"

        when 9
            return "#{romans[:one]}#{romans[:ten]}"

        else
            return ""

        end
    end

end