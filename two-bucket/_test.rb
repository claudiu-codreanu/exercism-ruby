require_relative "two_bucket"

b1 = Bucket.new(5)
b2 = Bucket.new(11)

puts b1.empty?
puts b2.full?

b1.fill!
b1.pour!(b2)

puts b1.filled_volume
puts b2.filled_volume

puts b1.available_volume
puts b2.available_volume