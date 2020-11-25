# Objective
# Today, we're learning and practicing an algorithmic concept called Recursion.

# Task
# Write a factorial function that takes a positive integer, N as a parameter and prints the result of N! (N factorial).
# Note: If you fail to use recursion or fail to name your recursive function factorial or Factorial, you will get a score of 0.

# Input Format
# A single integer, N (the argument to pass to factorial).

# Constraints
# 2 <= N <= 12
# Your submission must contain a recursive function named factorial.

# Output Format
# Print a single integer denoting N! .

# Solution
### Rewrite the question in your own words:
# Write a recursive function to perform factorials
# Input a single integer, output the factorial

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# Limited by the call stack, hence the max inut of 12. I may put in a check to avoid call stack errors
# Looks like the call stack is not a problem for this case for at least 1000

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Since the factorial is the number times each whole number below it, then recursion should be based on one lower number and breaks at 1
# take number in
# Base case: when number equals 1
# Recursive case: multiply accumulator times current number, then reduce number by one

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [X] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?


### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# Get integer smaller than 13
# accumulator = 1
# loop until number equals 1
#   number times recursive function of number -1
# break loop
# output accumulator value

### Write out any implementation code OR link to repl


number = gets.to_i

def factorial(n)
  if n <= 1
    return 1
  end
  n * factorial(n-1)
end

puts factorial number

### What is the Big O complexity of your solution?
# Recursion is a interesting here.
# The math is just O(1), but given the number of calculations that occur is directly equal to the input, so that would be linear O(n)
