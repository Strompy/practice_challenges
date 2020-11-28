# Objective
# Today, we're delving into Inheritance.

# Task
# You are given two classes, Person and Student, where Person is the base class and Student is the derived class.
# Completed code for Person and a declaration for Student are provided for you in the editor.
# Observe that Student inherits all the properties of Person.

# Complete the Student class by writing the following:
# A Student class constructor, which has 4 parameters:
# A string, first_name
# A string, last_name
# An integer, id
# An integer array (or vector) of test scores, scores
# A char calculate() method that calculates a Student object's average and returns the grade character representative of their calculated average

# Input Format
# The locked stub code in your editor calls your Student class constructor and passes it the necessary arguments.
# It also calls the calculate method (which takes no arguments).

# You are not responsible for reading the following input from stdin:
# The first line contains first_name, last_name, and id, respectively.
# The second line contains the number of test scores.
# The third line of space-separated integers describes scores


# Output Format
# This is handled by the locked stub code in your editor.
# Your output will be correct if your Student class constructor and calculate() method are properly implemented.

# Solution
### Rewrite the question in your own words:


### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)


### How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [ ] Math
# - [ ] Language API knowledge
# - [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?


### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)

### Write out any implementation code OR link to repl
class Person
	def initialize(firstName, lastName, id)
		@firstName = firstName
		@lastName = lastName
		@id = id
	end
	def printPerson()
		print("Name: ",@lastName , ", " + @firstName ,"\nID: " , @id)
	end
end

class Student <Person
    #   Class Constructor
    #
    #   Parameters:
    #   firstName - A string denoting the Person's first name.
    #   lastName - A string denoting the Person's last name.
    #   id - An integer denoting the Person's ID number.
    #   scores - An array of integers denoting the Person's test scores.
    #
    # Write your constructor here
    def initialize(firstName, lastName, id, scores)
        super(firstName, lastName, id)
        @scores = scores
    end

    #   Function Name: calculate
    #   Return: A character denoting the grade.
    #
    # Write your function here
    def calculate
      avg = @scores.sum(0.0) / @scores.length
      return "O" if 90 <= avg && avg <= avg && avg <=100
      return "E" if 80 <= avg && avg <= 90
      return "A" if 70 <= avg && avg <= 80
      return "P" if 55 <= avg && avg <= 70
      return "D" if 40 <= avg && avg <= 55
      return "T" if avg <= 40
    end
end

input = gets.split()
firstName = input[0]
lastName = input[1]
id = input[2].to_i
numScores = gets.to_i
scores = gets.strip().split().map!(&:to_i)
s = Student.new(firstName, lastName, id, scores)
s.printPerson
print("\nGrade: " + s.calculate)


### What is the Big O complexity of your solution?
