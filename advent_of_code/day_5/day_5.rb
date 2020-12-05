passes = File.readlines('input.txt').map do |line|
  line.tr('BFRL', '1010').to_i(2)
end

puts "Highest Seat: #{passes.max}"

passes.sort.each_cons(2) do |(a, b)|
  puts "My seat: #{a + 1}" if b - a > 1
end
