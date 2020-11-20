# practice_challenges
Various practice challenges

Several come from this [repo](https://github.com/Strompy/mod4-tech-challenges)

## Contents
1. [Problem solving approach](#approach)
1. [Hacker Rank 30 Days](#hacker)
1. [Palindrome Prompt](#palindrome)
1. [Roman Numeral Prompt](#roman)
1. [Million Integers](#million)
____

## Analyzing the Problem <a name="approach"></a>
## Instructions

1. Copy this markdown and paste in your own, private gist
2. In your private gist, fill out the questions below
4. Submit by the due time as instructed in Zoom


### Rewrite the question in your own words:


### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)


### How would you identify the elements of this problem?

- [ ] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [ ] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?


### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)

### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?

____


## HackerRank - 30 Days of Code <a name="hacker"></a>
![Hacker](https://media.giphy.com/media/3o7TKSx0g7RqRniGFG/giphy.gif)

From [HackerRank](https://www.hackerrank.com/domains/tutorials/30-days-of-code)

Since there are 30 of these, the prompts are in each individual file in the `hacker_rank` directory. Following my standard approach as outlined [above](#approach) and completed in 30 or 40 minute timeboxes depending on their listed difficulty level.

Solution code is in the second to last section, towards the bottom of each file
____


## Problem - Palindromic Numbers <a name="palindrome"></a>
![Palindrome](https://media.giphy.com/media/xT5LMYqyIPJtjnjiHm/giphy.gif)

The number 47 has an interesting characteristic.

If you take the number, plus its reverse (47 => 74) and then add them together to a number (47+74=121) the resulting sum is a palindrome

Starting at 0, find the first 25 numbers that have this same characteristic as 47, but limit it to where the palindrome is greater than 1000.

Collect the results in an array. Be sure that you're collecting the interesting numbers like 47, not the palindromic sums.

Bonus points if you can do this without converting numbers to strings/arrays.

Limit your online searches to core language documentation only.

____


## Problem - Roman Numerals <a name="roman"></a>
![Roman Numerals](https://media.giphy.com/media/xT5LMNd1ieywmnI3Qc/giphy.gif)

Write a recursive function that converts an integer into a string such that the number is represented in Roman Numerals in the most efficient way.

For example, the number `4` could be written as `IIII` but it's more efficient to use `IV`since that's a shorter string.

Assume no number is greater than 4,000.

Here are the Roman Numeral equivalents you'll need to know:
- M=1000
- CM=900
- D=500
- CD=400
- C=100
- XC=90
- L=50
- XL=40
- X=10
- IX=9
- V=5
- IV=4
- I=1

## JS Starter Code
```js
function toRoman(num) {
  // your code goes here
}

console.log(toRoman(128));  // should return "CXXVIII"
console.log(toRoman(2000)); // should return "MM"
console.log(toRoman(2017)); // should return "MMXVII"
console.log(toRoman(1999)); // should return "MCMXCIX"
```

## Ruby Starter Code
```rb
def to_roman(num)
  # your code goes here
end

puts to_roman(128)   # should return "CXXVIII"
puts to_roman(2000)  # should return "MM"
puts to_roman(2017)  # should return "MMXVII"
puts to_roman(1999)  # should return "MCMXCIX"
```

____

# Problem - Million Integers <a name="million"></a>
![Integers](https://media.giphy.com/media/h12hzyHiCNGRG/giphy.gif)

You have three arrays of equal size -- each has 1 million RANDOM integer values.

Each array is already sorted in ascending order. No individual array has any duplicate values.

Write a method that returns an array of any/all values which are present in all three arrays.

Solve this any way you can, then optimize to run in O(n) time and 1x space complexity.
