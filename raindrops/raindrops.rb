=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops

    def self.convert(n)
        sound = ""

        sound << "Pling" if n % 3 == 0
        sound << "Plang" if n % 5 == 0
        sound << "Plong" if n % 7 == 0

        sound.empty? ? n.to_s : sound
    end

end