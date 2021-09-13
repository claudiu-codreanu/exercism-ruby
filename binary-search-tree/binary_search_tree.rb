=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end

class Node

    attr_reader :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end

    def insert(data)
        data <= @data ? insert_left(data) : insert_right(data)
    end

    def each(&block)
        return enum_for(__method__) if block.nil?

        @left.each(&block) unless @left.nil?
        yield @data
        @right.each(&block) unless @right.nil?
    end

private

    def insert_left(data)
        if @left.nil?
            @left = Node.new(data)
        else
            @left.insert(data)
        end
    end

    def insert_right(data)
        if @right.nil?
            @right = Node.new(data)
        else
            @right.insert(data)
        end
    end

end


class Bst < Node

    def initialize(data)
        super(data)
    end

end


