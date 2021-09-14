=begin
Write your code for the 'Alphametics' exercise in this file. Make the tests in
`alphametics_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/alphametics` directory.
=end

class Alphametics

    # The obvious solution is based on recursive backtracking:
    #
    # - for every letter, there are 10 options (digits 0 through 9)
    # - skip digits which are already taken
    # - try non-taken digits one-by-one
    # - discard those that lead to dead-ends
    # - eventually this will uncover the solution
    #
    # This is relatively easy to implement, but non-optimal
    # (it becomes exponentially slower with 8, 9, and 10 digits)
    #
    # In any case, here it goes:

    def self.solve(puzzle)
        letters = puzzle
                    .chars
                    .select {|ch| "A" <= ch && ch <= "Z"}
                    .uniq
                    .sort

        hash = {}
        next_letter(letters, 0, hash, puzzle) ? hash : {}
    end

private

    def self.next_letter(letters, level, hash, puzzle)

        if level == letters.length
            return check_solution(hash, puzzle)
        end

        letter = letters[level]

        (0..9).each do |digit|
            next if hash.values.include?(digit)
            hash[letter] = digit

            if next_letter(letters, level + 1, hash, puzzle)
                return true
            end

            hash.delete(letter)
        end

        return false

    end


    def self.check_solution(hash, puzzle)
        solution = hash
                    .keys
                    .reduce(puzzle) {|memo, k| memo.gsub(k, hash[k].to_s)}

        return false if solution.match?(/\b0\d+\b/)
        eval(solution)
    end

end