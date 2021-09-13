=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock

    attr_reader :hour, :minute

    def initialize(time)
        h = time[:hour] || 0
        m = time[:minute] || 0

        @hour = (h + m / 60) % 24
        @minute = m % 60
    end

    def to_s
        "#{self.pad_zero(@hour)}:#{self.pad_zero(@minute)}"
    end

    def +(other)
        Clock.new(hour: self.hour + other.hour,
                  minute: self.minute + other.minute)
    end

    def -(other)
        Clock.new(hour: self.hour - other.hour,
                  minute: self.minute - other.minute)
    end

    def ==(other)
        self.hour == other.hour && self.minute == other.minute
    end

private

    def pad_zero(n)
        n.to_s.rjust(2, "0")
    end

end