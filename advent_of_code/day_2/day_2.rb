# Part 1
test = {"1-3 a" => "abcde",
"1-3 b" => "cdefg",
"2-9 c" => "ccccccccc"}

total_count = 0

test.each do |policy, password|
  times, letter = policy.split(" ")
  range = Range.new(*times.split("-").map(&:to_i))
  # require "pry"; binding.pry
  letter_count = password.count(letter)
  total_count += 1 if range.include?(letter_count)
end

puts total_count

# Take inputs and convert to hash with the policy as the key and the password as the value
# Iterate through that hash
# Inside break the key into two parts
# range is based on the range in the policy
# letter is the letter following the range
# Count the number of times the letter appears in the password
# Check if that count is within in the range
# If so, increment the total_count by one
