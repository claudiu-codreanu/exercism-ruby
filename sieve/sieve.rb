=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end

class Sieve

    def initialize(n)
        @n = n
    end

    def primes
        numbers = [*2..@n].map {|n| {n: n, is_prime: true}}
        crtPrime = 0

        loop do
            prime = numbers.find {|el| el[:n] > crtPrime && el[:is_prime]}
            break if prime.nil?

            crtPrime = prime[:n]
            factor = 2

            loop do
                multiple = crtPrime * factor
                break if multiple > @n

                numbers[multiple - 2][:is_prime] = false
                factor += 1
            end
        end

        numbers
            .select {|el| el[:is_prime]}
            .map {|el| el[:n]}
    end

end