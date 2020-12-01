# Day 1: Report Repair

After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to `2020` and then multiply those two numbers together.

For example, suppose your expense report contained the following:

```
1721
979
366
299
675
1456
```

In this list, the two entries that sum to `2020` are `1721` and `299`. Multiplying them together produces `1721 * 299 = 514579`, so the correct answer is `514579`.

Of course, your expense report is much larger. *Find the two entries that sum to `2020`; what do you get if you multiply them together?*

## Solution

### Rewrite the question in your own words:
Given a list of numbers, find the two that when added together equal `2020`
Then take those two numbers and multiply them together to find your answer

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* I will test with the smaller sample size, that may not always work for these as the efficiency could be one that improves with larger data

* I will assume that none of the inputs will be greater than 2020

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
* There could be a large list of data, efficiency will be key rather than just brute force. Although brute force could solve this problem.
* I will need to create a way to read the data for the final result.

### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
An array would be an easy way to store all the data, working with it would be less easy/risk of inefficiency. Using Ruby's find method would work, I don't know how it works under the hood with arrays and what the performance implications would be. Probably O(N^2) at a minimum.

A hash could help, looking up an exact key would be easy, just have to make up some values. If i know what I am looking for hashes are more efficient

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Take input file and convert into data structure (hash)
Loop until hash[2020-current_number] exists
iterate through hash, take current value and subtract it from 2020
check if that resulting value exists in the hash
if it exists then that is the other value
multiply current value with current other value


### Write out any implementation code OR link to repl
See day_1.rb

### What is the Big O complexity of your solution?
O(n) for part 1
Part 2 is worse with the permutation. It looks like O(n!)

___
# Part Two

The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to `2020` are `979`, `366`, and `675`. Multiplying them together produces the answer, `241861950`.

In your expense report, what is the product of the three entries that sum to 2020?
