# Objective
# Today, we're building on our knowledge of Arrays by adding another dimension.

# Context
# Given a 2D 6 x 6 Array, A:
# 1 1 1 0 0 0
# 0 1 0 0 0 0
# 1 1 1 0 0 0
# 0 0 0 0 0 0
# 0 0 0 0 0 0
# 0 0 0 0 0 0

# We define an hourglass in A to be a subset of values with indices falling in this pattern in A's graphical representation:
# a b c
#   d
# e f g

# There are 16 hourglasses in A, and an hourglass sum is the sum of an hourglass' values.

# Task
# Calculate the hourglass sum for every hourglass in A, then print the maximum hourglass sum.

# Input Format
# There are 6 lines of input, where each line contains 6 space-separated integers describing 2D Array A;
# every value in A will be in the inclusive range of -9 to 9

# Output Format
# Print the largest (maximum) hourglass sum found in A

# solution
### Rewrite the question in your own words:
# Given a 6 x 6 matrix (6 arrays of 6 integers), find the hourglass shape with the largest sum of its elements
# An hourglass is made of rows of 3, 1 and 3 elements.

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# Only outputting the max sum, so don't need to track anything but the current max
# The middle line has to be cenetered, so it can never be from the first or last array, nor the first or last element of an array
# total could be 0, if all elements are 0

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Navigate the grid by changing either the hourglass by one space at a time
# Store the current hourglass sum if it is greater than the tracking variable
# start in top left corner, then move to the right 3 times
# then move back to the left and down one
# Only 3 total down moves
# End at the final down and right movement

### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [X] Build/Navigate a Grid
# - [X] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Arrays are a given, the tricky part is not getting performance out of hand, since it will be several arrays
# Maybe I will use integer variable to track the current grid elements

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# horizontal and vertical tracking variables start at 0
# add array0 elements[0..(horizontal+2)]
# add array1 elements[(1+horizontal)]
# add array2 elements[0..(horizontal+2)]
# total all three rows and add to max variable if greater than max
# increment horizontal by one and repeat above until horizontal equals 3
# once horizontal equals 3, increment vertical by one and set horizontal to 0
# repeat the above until vertical equals 4

### Write out any implementation code OR link to repl
arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

horizontal = 0
vertical = 0
current_sum = 0
max_sum = -63 #smallest possible if all negative 9

while vertical < 4
  while horizontal < 4
    current_sum = arr[vertical][horizontal..(horizontal+2)].sum +
      arr[(vertical+1)][(horizontal+1)] +
      arr[(vertical + 2)][horizontal..(horizontal+2)].sum
    max_sum = current_sum if current_sum > max_sum
    horizontal += 1
  end
  horizontal = 0
  vertical += 1
end

puts max_sum

# add array0 elements[0..(horizontal+2)]
# add array1 elements[(1+horizontal)]
# add array2 elements[0..(horizontal+2)]
# total all three rows and add to max variable if greater than max
# increment horizontal by one and repeat above until horizontal equals 3
# once horizontal equals 3, increment vertical by one and set horizontal to 0
# repeat the above until vertical equals 4


### What is the Big O complexity of your solution?
