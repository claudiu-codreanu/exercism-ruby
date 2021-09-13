=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave

    def initialize(time)
        @time = time.to_s.rjust(4, "0")
    end

    def timer
        mins = @time[0..1].to_i
        secs = @time[2..3].to_i

        mins += secs / 60
        secs %= 60

        "#{mins.to_s.rjust(2, '0')}:#{secs.to_s.rjust(2, '0')}"
    end

end