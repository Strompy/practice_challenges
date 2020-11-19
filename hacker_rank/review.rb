# Objective
# Today we're expanding our knowledge of Strings and combining it with what we've already learned about loops.
#
# Task
# Given a string, S, of length N that is indexed from 0 to N - 1,
# print its even-indexed and odd-indexed characters as 2 space-separated strings on a single line.
#
# Note: 0 is considered to be an even index.
#
# Input Format
#
# The first line contains an integer, T (the number of test cases).
# Each line i of the T subsequent lines contain a String, S.
#
# Constraints
# 1 <=T <= 10
# 2 <= length of S <= 1000
#
# Output Format
#
# For each String S(j) (where 0 <= j <= T-1), print S(j)'s even-indexed characters, followed by a space,
# followed by S(j)'s odd-indexed characters.


# Solution
### Rewrite the question in your own words:
# Ask for an input number, that number is the number of input strings to be requested.
# Take those strings and reprint them based on the index of the characters.
# Print the even chars (starting with 0) then a space then the odd chars
# Each unique string will be on it's own line

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# There are constraints to thw number of strings and thir lengths, but I can easily write without that to be more dynamic.
# Case of the chars is consitent with the input
# Technically any char could be in the string, not just letters

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# First request the input number
# Based on that number request the same number of strings
# Then run the method.
# Break the string into an array and print based on indecies
# ???
# Profit

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [X] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Input strings will be turned into arrays for their ease of selection by index (Although strings have index numbers built it)
# Could do it all with strings, not sure if there is a performance differnece, but it would be one less step
# Initial idea would involve nested iterations, first through strings, then through chars

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# Get integer
# Times loop get string(s), store in array
# Iterate through each string
# Print the even index numbers + " " + odd index numbers
# End

### Write out any implementation code OR link to repl
puts "Number of strings"
num = gets.to_i
strings = []

num.times do |i|
  puts "String #{i+1}"
  strings << gets.chomp
end

strings.each do |string|
  len = string.size
  odds = []
  evens = []
  len.times do |i|
    odds << string[i] if i.odd?
    evens << string[i] if i.even?
  end
  puts evens.join + " " + odds.join
end


### What is the Big O complexity of your solution?
# O(n*m) since it iterates through the number of strings, then iterates through strings indiviudal chars (which can be different number than the number of strings in the array)
