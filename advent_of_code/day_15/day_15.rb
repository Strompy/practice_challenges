numbers = Hash.new { |h, k| h[k] =[] }
starting = [0, 13, 1, 16, 6, 17]
starting.each_with_index do |num, index|
  numbers[num] << index + 1
end
previous_num = numbers.keys.last
max = 30_000_000
turns = max - starting.size

turns.times do |turn|
  first_time = numbers[previous_num].size == 1
  previous_num = first_time ? 0 : (numbers[previous_num][-1] - numbers[previous_num][-2])
  numbers[previous_num] << turn + 7
end
puts "Part 2: #{previous_num}"

# puts numbers
# van_eck = Enumerator.new do |y|
#   array = [0, 13, 1, 16, 6, 17]
#   loop do
#     y << (term = array.last)  # yield
#     array << (array.count(term)==1 ? 0 : array.size - 1 - array[0..-2].rindex(term))
#   end
# end

# game = van_eck.take(2015)
# puts "Part 1: #{game.last}"
# game2 = van_eck.take(29999995)
# puts "Part 2: #{game2.last}"
