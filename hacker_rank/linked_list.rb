# Objective
# Today we're working with Linked Lists.

# A Node class is provided for you in the editor.
# A Node object has an integer data field, data, and a Node instance pointer, next, pointing to another node (i.e.: the next node in a list).
#
# A Node insert function is also declared in your editor.
# It has two parameters: a pointer, head, pointing to the first node of a linked list,
# and an integer data value that must be added to the end of the list as a new Node object.

# Task
# Complete the insert function in your editor so that it creates a new Node (pass data
# as the Node constructor argument) and inserts it at the tail of the linked list referenced by the head parameter.
# Once the new node is added, return the reference to the head node.
# Note: If the head argument passed to the insert function is null, then the initial list is empty.

# Input Format
#
# The insert function has 2
# parameters: a pointer to a Node named ead, and an integer value, data.
# The constructor for Node has 1 parameter: an integer value for the data field.
# You do not need to read anything from stdin.

# Output Format
# Your insert function should return a reference to the head node of the linked list.

# Sample Input
# The following input is handled for you by the locked code in the editor:
# The first line contains T, the number of test cases.
# The T subsequent lines of test cases each contain an integer to be inserted at the list's tail:
# 4
# 2
# 3
# 4
# 1

# Sample Output
# The locked code in your editor prints the ordered data values for each element in your list as a single line of space-separated integers:
# 2 3 4 1

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
class Node

  attr_accessor :data,:next

  def initialize data
      @data = data
      @next = nil
  end
end

class Solution

  def insert(head,value)
    if head.nil?
      current = Node.new(value)
    else
      current = head
      if current.next != nil
        insert(current.next, value)
      else
        current.next = Node.new(value)
      end
    end
    return current
  end

	def display(head)
       current = head
       while current
          print current.data," "
          current = current.next
       end
   end
end

mylist= Solution.new
head=nil
T=gets.to_i
for i in 1..T
    data=gets.to_i
    head=mylist.insert(head,data)
end

mylist.display(head)

### What is the Big O complexity of your solution?
