=begin
Write your code for the 'ETL' exercise in this file. Make the tests in
`etl_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/etl` directory.
=end

class ETL

    def self.transform(old_format)
        new_format = {}

        old_format.each_pair do |points, letters|
            letters.each {|letter| new_format[letter.downcase] = points}
        end

        new_format
    end

end