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

# Part 2

def floating(mem2, memory, value, mask, index = 0)
  if index == value.size
    mem2[memory] = value
    return
  end
  if mask[index] == '0' # no change
    floating(mem2, memory, value, mask, index + 1)
  elsif mask[index] == '1' # change to '1'
    memory_1 = memory.clone.tap { |x| x[index] = '1' }
    floating(mem2, memory_1, value, mask, index + 1)
  elsif mask[index] == 'X' #floating
    memory_0 = memory.clone.tap { |x| x[index] = '0' } # First possible float change
    memory_1 = memory.clone.tap { |x| x[index] = '1' } # Second possible float change
    floating(mem2, memory_0, value, mask, index + 1)
    floating(mem2, memory_1, value, mask, index + 1)
  end
end

mem2 = Hash.new(0)
inputs.each do |line|
  if line.start_with?('mask')
    _, mask = line.split(' = ')
  else
    memory, value = line.split(' = ')
    memory = memory[/\d+/].to_i.to_s(2).rjust(mask.size, '0')
    value = value.to_i.to_s(2).rjust(mask.size, '0')
    floating(mem2, memory, value, mask)
  end
end


puts "Part 2: "
p mem2.values.map { |num| num.to_i(2) }.sum
