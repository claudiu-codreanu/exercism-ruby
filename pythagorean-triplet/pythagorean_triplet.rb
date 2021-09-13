=begin
Write your code for the 'Pythagorean Triplet' exercise in this file. Make the tests in
`pythagorean_triplet_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pythagorean-triplet` directory.
=end

class Triplet

    def initialize(n1, n2, n3)
        @n1 = n1
        @n2 = n2
        @n3 = n3
    end

    def sum
        @n1 + @n2 + @n3
    end

    def product
        @n1 * @n2 * @n3
    end

    def pythagorean?
        (@n1 < @n2) && (@n2 < @n3) && (@n1 ** 2 + @n2 ** 2 == @n3 ** 2)
    end

    def self.where(min_factor: 1, max_factor: 1, sum: nil)
        triplets = []

        min_factor.upto(max_factor - 2).each do |n1|
            (n1 + 1).upto(max_factor - 1).each do |n2|
                (n2 + 1).upto(max_factor).each do |n3|

                    next unless (n1 ** 2 + n2 ** 2) == (n3 ** 2)
                    next unless (sum.nil?) || (n1 + n2 + n3 == sum)

                    triplets << Triplet.new(n1, n2, n3)

                end
            end
        end

        triplets
    end

end