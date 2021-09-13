=begin
Write your code for the 'Perfect Numbers' exercise in this file. Make the tests in
`perfect_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/perfect-numbers` directory.
=end

class PerfectNumber

    def self.classify(n)
        raise RuntimeError if n < 0
        sum = factorize(n).sum

        case
        when sum == n
            "perfect"
        when sum > n
            "abundant"
        else
            "deficient"
        end
    end

private

    def self.factorize(n)
        # 1.upto(n / 2).filter {|i| n % i == 0}
        [*1..n/2].select {|i| n % i == 0}

    end

end