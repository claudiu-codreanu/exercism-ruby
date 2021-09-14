=begin
Write your code for the 'Robot Simulator' exercise in this file. Make the tests in
`robot_simulator_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-simulator` directory.
=end

class Robot

    Directions = [:north, :east, :south, :west]

    attr_reader :bearing

    def orient(direction)
        raise ArgumentError unless Directions.include?(direction)
        @bearing = direction
    end

    def turn_right
        i = Directions.index(@bearing)
        @bearing = Directions[(i + 1) % 4]
    end

    def turn_left
        i = Directions.index(@bearing)
        @bearing = Directions[(i - 1) % 4]
    end

    def at(x, y)
        @x = x
        @y = y
    end

    def coordinates
        [@x, @y]
    end

    def advance
        case @bearing
        when :north
            @y += 1
        when :east
            @x += 1
        when :south
            @y -= 1
        when :west
            @x -= 1
        end
    end

end


class Simulator

    def instructions(moves)
        moves.chars.map do |c|
            case c
            when "L"
                :turn_left
            when "R"
                :turn_right
            when "A"
                :advance
            end
        end
    end

    def place(robot, x: 0, y: 0, direction: nil)
        robot.at(x, y)
        robot.orient(direction)
    end

    def evaluate(robot, moves)
        instructions(moves).each {|sym| robot.send(sym)}
    end

end