input = File.readlines("input.txt").map(&:to_i)

data = Hash.new
input.each do |datum|
  data[datum] = true
end

solution = 0

for i in 0..data.length do
  current_value = input[i]
  subtracted_value = 2020 - current_value
  if data[subtracted_value] == true
    solution = current_value * subtracted_value
    break
  end
end
puts solution

# second solution
duos = input.combination(2).to_a
combo = duos.find do |duo|
  duo.sum == 2020
end

puts combo.inject(:*)

# Part 2 - Find three values that add to 2020 and muliply them

# part 1
duos = input.combination(2).to_a
combo = duos.find do |duo|
  duo.sum == 2020
end
puts combo.inject(:*)

# part 2
trios = input.combination(3).to_a
combo = trios.find do |trio|
  trio.sum == 2020
end
puts combo.inject(:*)
