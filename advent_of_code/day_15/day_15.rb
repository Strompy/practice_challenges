
van_eck = Enumerator.new do |y|
  array = [0, 13, 1, 16, 6, 17]
  loop do
    y << (term = array.last)  # yield
    array << (array.count(term)==1 ? 0 : array.size - 1 - array[0..-2].rindex(term))
  end
end

game = van_eck.take(2015)
puts "Part 1: #{game.last}"
game2 = van_eck.take(29999995)
puts "Part 2: #{game2.last}"
