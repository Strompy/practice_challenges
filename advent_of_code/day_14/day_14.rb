inputs = File.readlines('input.txt').map(&:chomp)

mem = Hash.new(0)
mask = ''
inputs.each do |line|
  if line.start_with?('mask')
    _, mask = line.split(' = ')
  else
    memory, value = line.split(' = ')
    memory = memory[/\d+/]
    value = value.to_i.to_s(2).rjust(36, '0')
    mem[memory] = value
    mask.chars.each_with_index do |char, i|
      mem[memory][i] = '1' if char == '1'
      mem[memory][i] = '0' if char == '0'
    end
  end
end

puts "Part 1: "
p mem.values.map { |num| num.to_i(2) }.sum
