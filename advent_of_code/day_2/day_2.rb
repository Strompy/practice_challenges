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

# Take inputs and convert to hash with the policy as the key and the password as the value
# Iterate through that hash
# Inside break the key into two parts
# range is based on the range in the policy
# letter is the letter following the range
# Count the number of times the letter appears in the password
# Check if that count is within in the range
# If so, increment the total_count by one
