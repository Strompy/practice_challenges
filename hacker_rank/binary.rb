# Objective
# Today, we're working with binary numbers.

# Task
# Given a base-10 integer, n, convert it to binary (base-2).
# Then find and print the base-10 integer denoting the maximum number of consecutive 1's in n's binary representation.

# Input Format
# A single integer, n.

# Constraints
# 1 <= n <= 10^6

# Output Format
# Print a single base-10 integer denoting the maximum number of consecutive 1's in the binary representation of n.

# Solution
### Rewrite the question in your own words:
# Take an integer and convert it to binary
# count the number of consecutive 1's in the binary
# Return the total number of consecutives

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# Looks like the ruby conversion to binary outputs a string, so I will focus on string manipulation

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Take an integer
# convert it to binary (string format)
# count the number of consecutive 1's in the binary
# Return the total number of consecutives

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [X] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Strings for the binary. Downside is searching might be brute force and inefficient

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# Take input integer
# Convert to binary (string)
# iterate over the string comparing current and next char for them to both equal 1 (not performant)
# collect the count of those consecutives
# output the final count

### Write out any implementation code OR link to repl
n = gets.to_i

binary = n.to_s(2)

max = 0
count = 0

for i in 0...(binary.size)
	binary[i] == "0" ? count = 0 : count += 1
	max = count if max < count
end

puts max

### What is the Big O complexity of your solution?
# Linear based on the size of the binary, O(n)
