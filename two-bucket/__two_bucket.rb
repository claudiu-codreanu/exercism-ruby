=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end

class TwoBucket

    attr_accessor :moves, :goal_bucket, :other_bucket

    def initialize(vol1, vol2, target_amount, start_bucket)
        bucket_one = Bucket.new(vol1)
        bucket_two = Bucket.new(vol2)

        @target_amount = target_amount
        @start_bucket = start_bucket

        bucket_one.fill! if start_bucket == "one"
        bucket_two.fill! if start_bucket == "two"

        @states = []

        next_move(bucket_one, bucket_two, 1)
    end

    def next_move(bucket_one, bucket_two, move)

        return false if @states.include?([bucket_one.filled_volume, bucket_two.filled_volume])
        @states.push([bucket_one.filled_volume, bucket_two.filled_volume])

        if bucket_one.filled_volume == @target_amount
            @moves = move
            @goal_bucket = "one"
            @other_bucket = bucket_two.filled_volume

            return true
        end

        if bucket_two.filled_volume == @target_amount
            @moves = move
            @goal_bucket = "two"
            @other_bucket = bucket_one.filled_volume

            return true
        end

        if bucket_one.empty? && bucket_two.empty?
            return false
        end

        if bucket_one.full? && bucket_two.full?
            return false
        end

        if bucket_one.full? && bucket_two.empty? && @start_bucket == "two"
            return false
        end

        if bucket_one.empty? && bucket_two.full? && @start_bucket == "one"
            return false
        end


        unless bucket_one.empty?
            b1 = bucket_one.clone
            b1.empty!

            if next_move(b1, bucket_two.clone, move + 1)
                return true
            end
        end

        unless bucket_one.full?
            b1 = bucket_one.clone
            b1.fill!

            if next_move(b1, bucket_two.clone, move + 1)
                return true
            end
        end


        unless bucket_two.empty?
            b2 = bucket_two.clone
            b2.empty!

            if next_move(bucket_one.clone, b2, move + 1)
                return true
            end
        end

        unless bucket_two.full?
            b2 = bucket_two.clone
            b2.fill!

            if next_move(bucket_one.clone, b2, move + 1)
                return true
            end
        end
        

        unless bucket_one.empty? || bucket_two.full?
            b1 = bucket_one.clone
            b2 = bucket_two.clone
            b1.pour!(b2)

            if next_move(b1, b2, move + 1)
                return true
            end
        end


       

        unless bucket_two.empty? || bucket_one.full?
            b1 = bucket_one.clone
            b2 = bucket_two.clone
            b2.pour!(b1)

            if next_move(b1, b2, move + 1)
                return true
            end
        end

        return false
    end

end


class Bucket

    attr_reader :total_volume
    attr_accessor :filled_volume

    def initialize(volume, filled_volume = 0)
        @total_volume = volume
        @filled_volume = filled_volume
    end

    def fill!
        @filled_volume = @total_volume
    end

    def empty!
        @filled_volume = 0
    end

    def available_volume
        total_volume - filled_volume
    end

    def pour!(other)
        volume = [filled_volume, other.available_volume].min
        @filled_volume -= volume
        other.filled_volume += volume
    end

    def full?
        filled_volume == total_volume
    end

    def empty?
        filled_volume.zero?
    end

    def clone
        Bucket.new(total_volume, filled_volume)
    end

end