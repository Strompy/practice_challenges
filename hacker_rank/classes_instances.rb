# Objective
# In this challenge, we're going to learn about the difference between a class and an instance; because this is an Object Oriented concept, it's only enabled in certain languages.

# Task
# Write a Person class with an instance variable, age, and a constructor that takes an integer, initial_age, as a parameter.
# The constructor must assign initial_age to age after confirming the argument passed as initial_age is not negative;
# if a negative argument is passed as initial_age, the constructor should set age to 0
# and print 'Age is not valid, setting age to 0.'
# In addition, you must write the following instance methods:
#
# 1. year_passes() should increase the age instance variable by 1
# 2. am_i_old() should perform the following conditional actions:
#     If age < 13, print 'You are young.'
#     If age >= 13 and <=18, print 'You are a teenager.'
#     Otherwise, print 'You are old.'

# Input Format
#
# Input is handled for you by the stub code in the editor.
#
# The first line contains an integer, T (the number of test cases),
# and the T subsequent lines each contain an integer denoting the of age a Person instance.

# Constraints
# 1 <= T <=4
# -5 <= age <= 30

# Output Format
# Complete the method definitions provided in the editor so they meet the specifications outlined above;
# the code to test your work is already in the editor. If your methods are implemented correctly, each test case will print
# 2 or 3 lines (depending on whether or not a valid initial_age was passed to the constructor).

# Solution

### Rewrite the question in your own words:
# Create a person class with methods to determine age and if the person is old

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)


### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [X] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [X] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Object

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)

### Write out any implementation code OR link to repl

class Person
    attr_accessor :age
    def initialize(initial_age)
      # require "pry"; binding.pry
      # @age = initial_age
      # if initial_age < 0
      #   @age = 0
      #   puts 'Age is not valid, setting age to 0.'
      # end
      if initial_age < 0
        @age = 0
        puts 'Age is not valid, setting age to 0.'
      else
        @age = initial_age
      end
    end

    def am_i_old
      if @age < 13
        puts 'You are young.'
      elsif @age >= 13 && @age < 18
        puts 'You are a teenager.'
      else
        puts 'You are old.'
      end
    end

    def year_passes
      @age += 1
    end
end

# Whoever wrote this setup is not a rubyist

### What is the Big O complexity of your solution?
# Instantiating an object is interesting, probably just an O(1) and then same for the methods since they are simple boolean checks for a single value
