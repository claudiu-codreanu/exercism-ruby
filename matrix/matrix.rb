=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix

    attr_reader :rows, :columns

    def initialize(str)
        @rows = []
        @columns = []

        init_rows(str)
        init_cols if @rows.length > 0
    end

private

    def init_rows(str)
        str.split("\n").each do |line|
            row = line.split(" ").map {|token| token.to_i}
            @rows.push(row)
        end
    end


    def init_cols
        @rows.first.length.times { |i| @columns.push([]) }

        @rows.each do |row|
            row.each_with_index { |value, col| @columns[col].push(value) }
        end
    end

end