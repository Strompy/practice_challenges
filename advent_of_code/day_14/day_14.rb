inputs = File.readlines('test.txt').map(&:chomp)

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

# Part 2
mem2 = Hash.new(0)
inputs.each do |line|
  if line.start_with?('mask')
    _, mask = line.split(' = ')
  else
    memory, value = line.split(' = ')
    memory = memory[/\d+/]
    value = value.to_i.to_s(2).rjust(mask.size, '0')
    mem2[memory] = value
    mask.chars.each_with_index do |char, i|
      mem2[memory][i] = '1' if char == '1'
      mem2[memory][i] = 'X' if char == 'X'
    end
  end
end

values = []

def floating(num, values, index = 0)
  if index == num.size
    values << num
    return 0
  end
  if num[index] == '0' || num[index] == '1' # No change
    floating(num, values, index + 1)
  elsif num[index] == 'X'
    require "pry"; binding.pry
    num_0 = num.clone.tap { |x| x[index] = '0' } # First possible float change
    num_1 = num.clone.tap { |x| x[index] = '1' } # Second possible float change
    floating(num_0, values, index + 1)
    floating(num_1, values, index + 1)
  end
end

mem2.values.each do |num|
  if num.include?('X')
    floating(num, values)
  else
    values << num.to_i(2)
  end
end
require "pry"; binding.pry
puts values.size
puts "Part 2: "
p values.map { |num| num.to_i(2) }.sum
