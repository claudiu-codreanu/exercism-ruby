=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series

    def initialize(digits)
        @digits = digits
    end

    def slices(n)
        raise ArgumentError.new("Slice length cannot exceed string length") if n > @digits.length
        [*0..@digits.length - n].map {|i| @digits.slice(i, n)}
    end

end