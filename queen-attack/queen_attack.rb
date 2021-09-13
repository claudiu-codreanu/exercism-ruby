=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end

class Queens

    def initialize(white: [], black: [])
        verify_arguments(white, black)

        @white = white
        @black = black
    end

    def attack?
        return false unless @white.length == 2 and @black.length == 2

        dx = (@white[1] - @black[1]).abs
        dy = (@white[0] - @black[0]).abs


        # same row / same column
        return true if dx.zero? || dy.zero?

        # same diagonal
        return true if dx / dy == 1

        # neither
        false
    end

private

    def verify_arguments(white, black)
        [].concat(white, black).each do |i|
            raise ArgumentError if i < 0 || i > 7
        end
    end

end