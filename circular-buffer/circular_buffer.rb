=begin
Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
`circular_buffer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/circular-buffer` directory.
=end

class CircularBuffer

    class BufferEmptyException < StandardError
    end

    class BufferFullException < StandardError
    end


    def initialize(size)
        raise ArgumentError if size < 1

        @read_ptr = @write_ptr = Node.new
        prev_node = @read_ptr

        (size - 1).times do
            node = Node.new

            prev_node.next = node
            prev_node = node
        end

        # close the circular buffer
        prev_node.next = @read_ptr
    end

    def write(val)
        raise BufferFullException if full?

        @write_ptr.value = val
        @write_ptr = @write_ptr.next
    end

    def write!(val)
        if not full?
            # behaves like write
            write(val)
        else
            # overwrite oldest value
            @read_ptr.value = val
            @read_ptr = @read_ptr.next
        end
    end

    def read
        raise BufferEmptyException if empty?
        value = @read_ptr.value

        @read_ptr.value = nil
        @read_ptr = @read_ptr.next

        value
    end

    def clear
        while !empty?
            @read_ptr.value = nil
            @read_ptr = @read_ptr.next
        end

        @read_ptr = @write_ptr
    end

private

    def full?
        not @write_ptr.value.nil?
    end

    def empty?
        @read_ptr.value.nil?
    end

end


class Node

    attr_accessor :value, :next

end