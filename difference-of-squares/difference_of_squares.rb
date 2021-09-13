=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end

class Squares

    def initialize(n)
        @n = n
    end

    def square_of_sum
        (1..@n).sum ** 2
    end

    def sum_of_squares
        (1..@n).map {|i| i * i}.sum
    end

    def difference
        self.square_of_sum - self.sum_of_squares
    end

end