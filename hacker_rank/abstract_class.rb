# Objective
# Today, we're taking what we learned yesterday about Inheritance and extending it to Abstract Classes.
# Because this is a very specific Object-Oriented concept, submissions are limited to the few languages that use this construct.

# Task
# Given a Book class and a Solution class, write a MyBook class that does the following:
#   Inherits from Book
#   Has a parameterized constructor taking these 3 parameters:
#       string `title`
#       string `author
#       int `price`
#   Implements the Book class' abstract display() method so it prints these 3 lines:
#     title:, a space, and then the current instance's `title`
#     author:, a space, and then the current instance's `author`
#     price:, a space, and then the current instance's `price`
#
# Note: Because these classes are being written in the same file,
# you must not use an access modifier (e.g.: public)
# when declaring MyBook or your code will not execute.

# Input Format
# You are not responsible for reading any input from stdin. The Solution class creates a Book object and calls the MyBook class constructor (passing it the necessary arguments). It then calls the display method on the Book object.

# Output Format
# The void display() method should print and label the respective title, author, and price of the MyBook object's instance (with each value on its own line) like so:
# Title: $title
# Author: $author
# Price: $price

# Solution
### Rewrite the question in your own words:
# Write a child class of Book and override the existing function to return the books attributes formatted correctly

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)


### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [X] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?


### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
## This is a **simulation** of an abstract class provided at user request. ##
class Book
    attr_accessor :title
	attr_accessor :author

	def initialize(title, author)
		raise 'You cannot instantiate an abstract class.'
	end

	def display
		raise 'You must override this method in your implementing class.'
	end
end

class MyBook < Book
    attr_accessor :price

    def initialize(title, author, price)
      @title = title
      @author = author
      @price = price
    end


    def display
      puts "Title: #{title}"
      puts "Author: #{author}"
      puts "Price: #{price}"
    end

end
title = gets
author = gets
price = gets

new_novel = MyBook.new(title, author, price)
new_novel.display


### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?
