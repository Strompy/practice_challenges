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

# Part 2 - Find three values that add to 2020 and muliply them


trios = input.combination(3).to_a

combo = trios.find do |trio|
  trio.sum == 2020
end

puts combo.inject(:*)
