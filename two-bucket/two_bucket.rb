=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end

class TwoBucket

    MAX_MOVES = 100

    attr_accessor :moves, :goal_bucket, :other_bucket

    def initialize(volume_one, volume_two, target_amount, start_bucket)
        @volume_one = volume_one
        @volume_two = volume_two

        @target_amount = target_amount
        @start_bucket = start_bucket


        # fill start bucket and leave the other one empty, counts as one move
        (level_one, level_two) = start_bucket == "one" ? [volume_one, 0] : [0, volume_two]
        move = 1

        # per requirements, the opposite of the above is an invalid state
        @visited = start_bucket == "one" ? [[0, volume_two]] : [[volume_one, 0]]


        # at any step, there are three possible moves per bucket (fill, empty, pour)
        # most will lead to dead-ends and can be discarded
        # but some will uncover the actual solution
        # this is classic backtracking, so my solution uses recursive backtracking

        ok = next_move(level_one, level_two, move)
        puts "Could not find a solution!" unless ok
    end

    def next_move(level_one, level_two, move)
        # avoid infinite recursion
        return false if move > MAX_MOVES

        # discard this combination if already visited
        return false if @visited.include?([level_one, level_two])

        # mark this combination as visited
        @visited.push([level_one, level_two])


        if level_one == @target_amount
            # bingo, bucket 1 contains the desired amount!

            @goal_bucket = "one"
            @other_bucket = level_two
            @moves = move

            return true
        end

        if level_two == @target_amount
            # bingo, bucket 2 contains the desired amount!
            
            @moves = move
            @goal_bucket = "two"
            @other_bucket = level_one

            return true
        end


        # try filling bucket 1, leave bucket 2 intact
        unless level_one == @volume_one
            if next_move(@volume_one, level_two, move + 1)
                return true
            end
        end

        # try filling bucket 2, leave bucket 1 intact
        unless level_two == @volume_two
            if next_move(level_one, @volume_two, move + 1)
                return true
            end
        end


        # try emptying bucket 1, leave bucket 2 intact
        unless level_one.zero?
            if next_move(0, level_two, move + 1)
                return true
            end
        end

        # try emptying bucket 2, leave bucket 1 intact
        unless level_two.zero?
            if next_move(level_one, 0, move + 1)
                return true
            end
        end


        # try pouring from bucket 1 into bucket 2
        unless level_one.zero? || level_two == @volume_two
            amount = [level_one, @volume_two - level_two].min
            if next_move(level_one - amount, level_two + amount, move + 1)
                return true
            end
        end


       # try pouring from bucket 2 into bucket 1
        unless level_two.zero? || level_one == @volume_one
            amount = [level_two, @volume_one - level_one].min
            if next_move(level_one + amount, level_two - amount, move + 1)
                return true
            end
        end

        # sorry, nothing worked
        return false
    end

end