=begin
Write your code for the 'Robot Name' exercise in this file. Make the tests in
`robot_name_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-name` directory.
=end

class Robot

    LETTERS = 2
    DIGITS = 3

    attr_reader :name

    @@letters = [*"A".."Z"]
    @@digits = [*0..9]

    @@names = {}


    def self.forget
        @@names = {}
    end


    def initialize
        @name = find_avail_name
    end

    def reset
        @name = find_avail_name
    end

private

    def find_avail_name
        while true
            name = Robot.rand_name

            if Robot.name_available?(name)
                Robot.reserve_name(name)
                return name
            end
        end
    end


    def self.rand_name
        rand_seq(@@letters, LETTERS) +
            rand_seq(@@digits, DIGITS)
    end

    def self.rand_seq(arr, len)
        len.times.map {| | arr[ rand(arr.size) ]}.join
    end


    def self.name_available?(name)
        !@@names.include?(name)
    end

    def self.reserve_name(name)
        @@names[name] = nil
    end

end