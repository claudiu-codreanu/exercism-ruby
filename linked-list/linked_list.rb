=begin
Write your code for the 'Linked List' exercise in this file. Make the tests in
`linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/linked-list` directory.
=end

class Deque

    def initialize
        @first = @last = nil
    end

    def push(val)
        node = Node.new(val)

        if @last.nil?
            @first = node
        else
            @last.next = node
            node.prev = @last
        end

        @last = node
    end

    def pop
        return nil if @last.nil?

        node = @last
        @last = node.prev

        if @last.nil?
            @first = nil
        else
            @last.next = nil
        end

        node.value
    end

    def shift
        return nil if @first.nil?

        node = @first
        @first = node.next
        
        if @first.nil?
            @last = nil
        else
            @first.prev = nil
        end

        node.value
    end

    def unshift(val)
        node = Node.new(val)

        if @first.nil?
            @last = node
        else
            node.next = @first
            @first.prev = node
        end

        @first = node
    end

end

class Node

    attr_reader :value
    attr_accessor :prev, :next

    def initialize(val)
        @value = val
        @prev = @next = nil
    end

end