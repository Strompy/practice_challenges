test = (1..26).to_a
test << 50

invalid = 0
test.drop(26).each_with_index do |num, index|
  valid = test[index..index+24].permutation(2).to_a.find { |combo| combo.sum == num }
  invalid = num if valid.nil?
end

puts "Part 1: #{invalid}"
