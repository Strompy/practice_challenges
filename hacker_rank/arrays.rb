# Objective
# Today, we're learning about the Array data structure.
#
# Task
# Given an array, a, of n integers, print a's elements in reverse order as a single line of space-separated numbers.
#
# Input Format
#
# The first line contains an integer, n (the size of our array).
# The second line contains n space-separated integers describing array a's elements.
#
# Constraints
# 1 <= n <= 1000
# 1 <= a[i] <= 10000, where a[i] is the i^th integer in the array.
#
# Output Format
#
# Print the elements of array
# in reverse order as a single line of space-separated numbers.

# Solution


### Rewrite the question in your own words:
# Take an input integer. That will be the size of the array
# Then take inputs for each element (all integers) of the array.
# Print out those elements in reverse order in a single line seperated by spaces

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# Even though we are taking in integers, I assume I can convert to strings for printing

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Array input code is already given.
# Could just join the array and then reverse it
# Could do something with pop and string concatenation

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [X] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Strings are easy to manipulate and it is easy to convert an array into a string. Cons, it's not exaclty array manipulation...

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# join input array with a space between elements
# reverse that string
# output

# That didn't pass all their hidden tests. So Instead I will reverse the array first and the join

### Write out any implementation code OR link to repl
puts 'How many elements in your array?'
n = gets.to_i

puts "Input all #{n} elements of the array"
arr = gets.rstrip.split(' ').map(&:to_i)

# string = arr.join(' ')
# puts string.reverse

puts arr.reverse.join(' ')

### What is the Big O complexity of your solution?
