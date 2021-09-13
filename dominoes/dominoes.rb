=begin
Write your code for the 'Dominoes' exercise in this file. Make the tests in
`dominoes_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dominoes` directory.
=end

class Dominoes

    def self.chain?(stones)
        return true if stones.length.zero?


        # create the pile of Stone objects
        remaining_stones = stones.map {|left, right| Stone.new(left, right)}

        # init chain using the first stone, and remove it from the pile
        current_chain = [ remaining_stones.shift ]


        # this looks like classic backtracking:

        # you have the chain so far on one hand,
        # and the pile of remaining stones on the other hand

        # you pick the remaining stones one-by-one,
        # discard what doesn't fit or what leads to dead-ends,
        # and keep what works

        # eventyally, if there's a winning combination, you'll come across it


        # start the recursion
        return next_move(current_chain, remaining_stones)
    end

private

    def self.next_move(current_chain, remaining_stones)

        if remaining_stones.length.zero?
            # all stones have been linked, we may have a winner
            return current_chain.first.left == current_chain.last.right
        end

        remaining_stones.length.times do

            # pick the next stone from the pile
            next_stone = remaining_stones.shift

            if next_stone.left != current_chain.last.right

                # try the other end
                next_stone.reverse!

                if next_stone.left != current_chain.last.right

                    # doesn't fit, return it to the pile...
                    remaining_stones.push(next_stone)

                    # and try the next stone
                    next

                end
            end


            # it fits, add it to the chain...
            current_chain.push next_stone

            # and continue the recursion
            if next_move(current_chain, remaining_stones)

                # found a winning combination!
                return true

            end


            # it didn't work, remove it from the chain...
            current_chain.pop

            # and return it to the pile
            remaining_stones.push(next_stone)
        end


        # didn't find a winning combination
        return false
    end

end


class Stone

    attr_reader :left, :right
    attr_accessor :used

    def initialize(left, right)
        @left = left
        @right = right
    end

    def reverse!
        temp = @left

        @left = @right
        @right = temp
    end

end