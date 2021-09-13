=begin
Write your code for the 'Nth Prime' exercise in this file. Make the tests in
`nth_prime_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nth-prime` directory.
=end

class Prime

    @@primes = [2]

    def self.nth(n)
        raise ArgumentError.new("There is no zeroth prime") if n == 0

        i = @@primes.last + 1

        while @@primes.size < n
            @@primes << i if Prime.prime?(i)
            i += 1
        end

        @@primes[n - 1]
    end

    def self.prime?(n)
        # (2..Math.sqrt(n)).none? {|i| (n % i).zero?}

        (2..Math.sqrt(n).to_i).each do |i|
            return false if n % i == 0
        end

        return true
    end
end