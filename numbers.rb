# Problem - Numbers
# ![Integers](https://media.giphy.com/media/h12hzyHiCNGRG/giphy.gif)
#
# You have three arrays of equal size -- each has 1 million RANDOM integer values.
#
# Each array is already sorted in ascending order. No individual array has any duplicate values.
#
# Write a method that returns an array of any/all values which are present in all three arrays.
#
# Solve this any way you can, then optimize to run in O(n) time and 1x space complexity.

# Instructions

# 1. Copy this markdown and paste in your own, privte gist
# 2. In your private gist, fill out the questions below
# 4. Submit by the due time as instructed in Zoom


## Rewrite the question in your own words:
# You have three arrays with a million elements, each one an integer.
# No Array has duplicate elements within itself
# Each array is sorted in ascending order
# Find any and all elements that occur in each of the arrays

## What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# I am going to write smaller arrays to work with, if the solution works for the smaller sets it should scale

## What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Have to compare elements across three arrays.
# Since they are in order, maybe you can move through them together. So that if the current element in one array is smaller than the current element in the other arrays then you should move on to the next element
# It would be too complex running each element through each array since they are a million elements long


## How would you identify the elements of this problem?

# - [X] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [ ] Language API knowledge
# - [X] Optimization


## Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Arrays utilizing the index numbers. Hopefully I can iterate through just the one array for O(n)

## Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)

# Iterate through just the one and compare based on index numbers
# Compare Array1[0] to array2[0] and array3[0].
# If array1[0] is greater than array2[0], then move array2 to the next index
# If array1[0] is greater than array3[0], then move array3 to the next index
# If element matches all three then put in accumulator

## Write out any implementation code OR link to repl
array1 = [0, 1, 4, 6, 7, 9]
array2 = [1, 4, 6, 7, 9, 10]
array3 = [0, 1, 2, 4, 6, 9]

matching_integers = []
index2 = 0
index3 = 0

array1.each do |element|
  until index2 == array2.size || element <= array2[index2] do
    index2 += 1
  end
  until index3 == array3.size || element <= array3[index3] do
    index3 += 1
  end
  matching_integers << element if element == array2[index2] && array3[index3]
end

p matching_integers

## What is the Big O complexity of your solution?
# O(n) The one iteration is O(n) then all my interal workings are booleans or simple math which should be O(1).
# Therefore the worst case is O(n)
