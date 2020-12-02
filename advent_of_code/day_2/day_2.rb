# Part 1

lines = File.readlines('input.txt')

inputs = lines.map do |line|
  key, value = line.chomp.split(':')
end

good_passwords = inputs.select do |policy, password|
  times, letter = policy.split(' ')
  range = Range.new(*times.split('-').map(&:to_i))
  letter_count = password.count(letter)
  range.include?(letter_count)
end

puts good_passwords.size

# Part 2

good_passwords = inputs.select do |policy, password|
  times, letter = policy.split(' ')
  position1, position2 = times.split('-').map(&:to_i)
  require "pry"; binding.pry
  (password[position1 - 1] == letter) ^ (password[position2 - 1] == letter)
end
require "pry"; binding.pry

puts good_passwords.size
