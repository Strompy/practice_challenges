# Objective
# In this challenge, we're going to use loops to help us do some simple math.
#
# Task
# Given an integer, n, print its first 10 multiples.
# Each multiple n * i (where 1<= i <=10) should be printed on a new line in the form: n x i = result.
#
# Input Format
#
# A single integer, n
#
# Constraints
# 2 <= n <= 20
#
# Output Format
#
# Print 10 lines of output; each line i (where 1<= i <=10) contains the result of n * i in the form:
# n x i = result.


# Solution
### Rewrite the question in your own words:
# Use a loop to print a basic multiplication table from 1 to 10 for a given input
# Print the whole equation for each iteration

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Create a loop that will break when index greater than or equal to 10
# Each iteration prints out input times index = result

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [X] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# strings and integers. Strings interpolation of the integers to print the correct output

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)

# while index <= 10
# print input * index = result


### Write out any implementation code OR link to repl
puts "Pick a number"
n = gets.to_i
i = 1
while i <= 10
  puts "#{n} x #{i} = #{n*i}"
  i += 1
end


### What is the Big O complexity of your solution?
# O(10) it will always run 10 calculations
