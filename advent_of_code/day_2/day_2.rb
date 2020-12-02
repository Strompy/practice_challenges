# Part 1

lines = File.readlines('input.txt')

good_passwords = lines.count do |line|
	policy, password = line.split(': ')
  positions, letter = policy.split(' ')
  range = Range.new(*positions.split('-').map(&:to_i))
  letter_count = password.count(letter)
  range.include?(letter_count)
end

puts good_passwords

# Part 2
good_passwords = lines.count do |line|
	policy, password = line.split(': ')
	positions, letter = policy.split(' ')
	position1, position2 = positions.split('-').map(&:to_i)
	(letter == password[position1 - 1]) ^ (letter == password[position2 - 1])
end

puts good_passwords
