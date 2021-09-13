=begin
Write your code for the 'Grains' exercise in this file. Make the tests in
`grains_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grains` directory.
=end

class Grains

    def self.square(n)
        raise ArgumentError.new if !(1..64).include?(n)
        2 ** (n - 1)
    end

    def self.total
        (1..64).map {|n| Grains.square(n)}.sum
    end

end