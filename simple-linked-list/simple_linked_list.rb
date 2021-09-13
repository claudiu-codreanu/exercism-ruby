=begin
Write your code for the 'Simple Linked List' exercise in this file. Make the tests in
`simple_linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/simple-linked-list` directory.
=end

class Element

    attr_reader :datum
    attr_accessor :next

    def initialize(val)
        @datum = val
    end

end


class SimpleLinkedList

    def initialize(arr = [])
        @first = nil
        arr.each {|item| push(Element.new(item))}
    end


    def push(elem)

        # empty list
        if @first.nil?
            @first = elem
            return self
        end

        # non-empty list
        crt = @first

        until crt.next.nil?
            crt = crt.next
        end

        crt.next = elem
        self
    end


    def pop

        # empty list
        return nil if @first.nil?

        # exactly one element
        if @first.next.nil?
            elem = @first
            @first = nil

            return elem
        end

        # two elements or more
        prev = @first
        crt = prev.next

        until crt.next.nil?
            prev = crt
            crt = crt.next
        end

        prev.next = nil
        crt
    end


    def to_a
        arr = []
        crt = @first

        until crt.nil?
            arr << crt.datum
            crt = crt.next
        end

        arr.reverse
    end

    
    def reverse!
        arr = []

        until @first.nil?
            arr << pop
        end

        arr.each {|elem| push(elem)}
        self
    end

end