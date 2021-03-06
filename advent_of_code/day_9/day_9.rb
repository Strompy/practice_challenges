data = File.read("input.txt").split("\n").map(&:to_i)

invalid = 0
data.drop(25).each_with_index do |num, index|
  valid = data[index..index+24].combination(2).to_a.find { |combo| combo.sum == num }
  invalid = num if valid.nil?
end
puts "Part 1: #{invalid}"

part_2 = 0
(2..data.size).each do |size|
  data.each_cons(size) do |array|
    if array.reduce(:+) == invalid
      part_2 = array.min + array.max
    end
  end
end
puts "Part 2: #{part_2}"
