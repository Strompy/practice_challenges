test = (1..26).to_a
test << 50

data = File.read("input.txt").split("\n").map(&:to_i)

invalid = 0
data.drop(25).each_with_index do |num, index|
  valid = data[index..index+24].combination(2).to_a.find { |combo| combo.sum == num }
  invalid = num if valid.nil?
end

puts "Part 1: #{invalid}"
