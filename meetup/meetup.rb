=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

require "date"

class Meetup

    def initialize(month, year)
        @date = Date.new(year, month, 1)
    end

    def day(day_sym, count_sym)
        wday = sym_to_wday(day_sym)
        count = sym_to_count(count_sym)
        last = nil

        @date.upto(@date.next_month - 1).each do |date|
            next if date.cwday != wday

            case count_sym
            when :teenth
                return date if 13 <= date.day && date.day <= 19
            when :first, :second, :third, :fourth
                count -= 1
                return date if count == 0
            when :last
                last = date
            end
        end

        return last if count_sym == :last
        nil
    end

private

    def sym_to_wday(sym)
        case sym
        when :monday
            return 1
        when :tuesday
            return 2
        when :wednesday
            return 3
        when :thursday
            return 4
        when :friday
            return 5
        when :saturday
            return 6
        when :sunday
            return 7
        else
            return 0
        end
    end

    def sym_to_count(sym)
        case sym
        when :first
            return 1
        when :second
            return 2
        when :third
            return 3
        when :fourth
            return 4
        else
            return 0
        end
    end
    
end