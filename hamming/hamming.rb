=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming

    def self.compute(a = "", b = "")
        raise ArgumentError.new("Strands A and B must have the same length") if a.length != b.length
        [*0..a.length].reduce(0) {|memo, i| memo + (a[i] != b[i] ? 1 : 0)}
    end

end