# Objective
# In this challenge, we're getting started with conditional statements.
#
# Task
# Given an integer, n, perform the following conditional actions:
#
# If n is odd, print Weird
# If n is even and in the inclusive range of 2 to 5, print Not Weird
# If n is even and in the inclusive range of 6 to 20, print Weird
# If n is even and greater than 20, print Not Weird
#
# Complete the stub code provided in your editor to print whether or not n is weird.
#
# Input Format
#
# A single line containing a positive integer, n
#
# Constraints
# 1 <= n <= 100
# Output Format
#
# Print Weird if the number is weird; otherwise, print Not Weird.

# Solution

### Rewrite the question in your own words:
# Print weird or not weird based on the input number.
# Odd numbers are always weird, even numbers between 6 and 20 are weird, everything else is not weird
# Input has to be between 1 and 100

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Take the input number and check for constraints first
# then check for oddness
# Then check for the 6 to 20 range
# If none of those then it is not weird

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [X] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?

# integer input and string output, with boolean conditionals

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# Take the input number and check for constraints first
# then check for oddness
# Then check for the 6 to 20 range
# If none of those then it is not weird

### Write out any implementation code OR link to repl
puts "Please select number between 1 and 100"
N = gets.to_i

def weird?(num)
  return "Please select number between 1 and 100" if num.class != Integer || num < 1 || num > 100
  if num.odd? || (6..20).include?(num)
    print "Weird"
  else
    print "Not Weird"
  end
end

### What is the Big O complexity of your solution?
# O(1)
