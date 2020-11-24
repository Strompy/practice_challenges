# Objective
# Today, we're learning about Key-Value pair mappings using a Map or Dictionary data structure.
#
# Task
# Given n names and phone numbers, assemble a phone book that maps friends' names to their respective phone numbers.
# You will then be given an unknown number of names to query your phone book for.
# For each name queried, print the associated entry from your phone book on a new line in the form `name=phoneNumber`;
# if an entry for name is not found, print `Not found` instead.
#
# Note: Your phone book should be a Dictionary/Map/HashMap data structure.
#
# Input Format
# The first line contains an integer, n, denoting the number of entries in the phone book.
# Each of the n subsequent lines describes an entry in the form of 2 space-separated values on a single line.
# The first value is a friend's name, and the second value is an 8-digit phone number.
#
# After the n lines of phone book entries, there are an unknown number of lines of queries.
# Each line (query) contains a name to look up, and you must continue reading lines until there is no more input.
#
# Note: Names consist of lowercase English alphabetic letters and are first names only.
#
# Constraints
# 1 <= n <=10^5
# 1 <= queries <= 10^5
#
# Output Format
#
# On a new line for each query, print `Not found` if the name has no corresponding entry in the phone book;
# otherwise, print the full name and in the format `name=phoneNumber`.

# Solution
### Rewrite the question in your own words:
# Take an input number, that will be the number of elements in the hash
# Next take in the elements of the hash, the key and value will be space separated
# Then take in an unknown number queries for the hash, outputting the key and value or `Not found`

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# Number of queries is only limited to the upper bound of 10^5, so will need some loop
# They specify the number will be the correct format, so I will not put a check in for 8 digits

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Take inputs for the hash based on the initial input integer
# Loop until input in nil for the lookups
# Each look up will be simple with printing the key value pair as a string or `Not found`

### How would you identify the elements of this problem?

# - [X] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [X] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Hashes, since that is what the exercise is for... But they are very performant when you know what you are looking for

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
# Take input for size of hash
# Take in hash values
# String manipulate them into key value pairs based on the space
# Loop input until it equals nil?
# Check input against the hash
# Print the key value pair or `Not found`
# fin

# HackerRank cannot do gets.chomp, so I have to work around that

### Write out any implementation code OR link to repl
puts "Size of hash?"
size = gets.to_i

hash = Hash.new

puts "Enter name and number"
size.times do |i|
  name, number = gets.chomp.split(' ')
  hash[name] = number
end

puts 'Query'

until (query = gets).empty?
  query.chomp!
  puts hash[query] ? "#{query}=#{hash[query]}" : "Not found"
  puts 'Query'
end

### What is the Big O complexity of your solution?
# O(1), searching an array for a value is easy
