# Objective
# In this challenge, you'll work with arithmetic operators.
#
# Task
# Given the meal price (base cost of a meal), tip percent (the percentage of the meal price being added as tip), and tax percent (the percentage of the meal price being added as tax) for a meal, find and print the meal's total cost.
#
# Note: Be sure to use precise values for your calculations, or you may end up with an incorrectly rounded result!
#
# Input Format
#
# There are 3 lines of numeric input:
# The first line has a double, MealCost(the cost of the meal before tax and tip).
# The second line has an integer, TipPercent(the percentage of MealCost being added as tip).
# The third line has an integer, TaxPercent(the percentage of MealCost being added as tax).
#
# Output Format
#
# Print the total meal cost, where TotalCost
# is the rounded integer result of the entire bill (MealCost with added tax and tip).




## Rewrite the question in your own words:
# Given a meal_price, tax_percent, and tip_percent, output the total_cost of the meal rounded up to the nearest integer

## What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
# Tip and tax can be any integer greater than or equal to zero (less than zero wouldn't make sense in this context where they pay you...)
# Mealcost could be zero, but that would just mean the total cost is zero. In some odd scenario where you wouldn't pay for food but would leave a tip, won't be accounted for here.

## What are your initial thoughts about this problem? (high level design, 2-3 sentences)
# Take in the three arguments
# Run tip and tax one through their own calculations
# Add results to meal_cost and return

## How would you identify the elements of this problem?

# - [ ] Searching of Data
# - [ ] Sorting of Data
# - [ ] Pattern Recognition
# - [ ] Build/Navigate a Grid
# - [X] Math
# - [ ] Language API knowledge
# - [ ] Optimization


## Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
# Just inputs and outputs of integers, floats for the calculations, since simple math is required
# round the final output to get the closest integer

## Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)

# Input meal_cost, tip_percent, tax_percent
# meal_cost times tip_percent/100 = tip
# meal_cost times tax_percent/100 = tax
# add meal_cost + tip + tax

## Write out any implementation code OR link to repl

def solve(meal_cost, tip_percent, tax_percent)
  tip = meal_cost * (tip_percent.to_f / 100)
  tax = meal_cost * (tax_percent.to_f / 100)
  p (meal_cost + tip + tax).round
end

solve(12.00, 20, 8)

## What is the Big O complexity of your solution?
# O(1)
# Unless round does something odd under the hood
