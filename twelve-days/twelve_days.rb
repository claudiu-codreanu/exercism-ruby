=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays

    def self.song

        presents = ["Partridge in a Pear Tree", "Turtle Doves", "French Hens",
                    "Calling Birds", "Gold Rings", "Geese-a-Laying",
                    "Swans-a-Swimming", "Maids-a-Milking", "Ladies Dancing",
                    "Lords-a-Leaping", "Pipers Piping", "Drummers Drumming"]

        days = ["first", "second", "third", "fourth", "fifth", "sixth",
                "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

        amounts = ["a", "two", "three", "four", "five", "six",
                    "seven", "eight", "nine", "ten", "eleven", "twelve"]


        days.each_with_index.map do |day, i|
            s = i.downto(1).map {|n| "#{amounts[n]} #{presents[n]}"}.join(", ")

            s += ", and " if s != ""
            s += "#{amounts[0]} #{presents[0]}"

            "On the #{day} day of Christmas my true love gave to me: #{s}.\n"
        end.join("\n")

    end

end