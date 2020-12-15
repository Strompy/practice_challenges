# Day 15: Rambunctious Recitation

You catch the airport shuttle and try to book a new flight to your vacation island. Due to the storm, all direct flights have been cancelled, but a route is available to get around the storm. You take it.

While you wait for your flight, you decide to check in with the Elves back at the North Pole. They're playing a **memory game** and are ever so excited to explain the rules!

In this game, the players take turns saying **numbers**. They begin by taking turns reading from a list of **starting numbers** (your puzzle input). Then, each turn consists of considering the **most recently spoken number**:

    * If that was the **first** time the number has been spoken, the current player says `0`.
    * Otherwise, the number had been spoken before; the current player announces **how many turns apart** the number is from when it was previously spoken.

So, after the starting numbers, each turn results in that player speaking aloud either **0** (if the last number is new) or an **age** (if the last number is a repeat).

For example, suppose the starting numbers are `0,3,6`:

    * Turn 1: The `1`st number spoken is a starting number, `0`.
    * Turn 2: The `2`nd number spoken is a starting number, `3`.
    * Turn 3: The `3`rd number spoken is a starting number, `6`.
    * Turn 4: Now, consider the last number spoken, `6`. Since that was the first time the number had been spoken, the `4`th number spoken is `0`.
    * Turn 5: Next, again consider the last number spoken, `0`. Since it had been spoken before, the next number to speak is the difference between the turn number when it was last spoken (the previous turn, `4`) and the turn number of the time it was most recently spoken before then (turn `1`). Thus, the `5`th number spoken is `4 - 1`, `3`.
    * Turn 6: The last number spoken, `3` had also been spoken before, most recently on turns 5 and 2. So, the `6`th number spoken is `5 - 2`, `3`.
    * Turn 7: Since `3` was just spoken twice in a row, and the last two turns are `1` turn apart, the 7th number spoken is `1`.
    * Turn 8: Since `1` is new, the `8`th number spoken is `0`.
    * Turn 9: `0` was last spoken on turns `8` and `4`, so the `9`th number spoken is the difference between them, `4`.
    * Turn 10: `4` is new, so the `10`th number spoken is `0`.

(The game ends when the Elves get sick of playing or dinner is ready, whichever comes first.)

Their question for you is: what will be the **`2020`th** number spoken? In the example above, the `2020`th number spoken will be `436`.

Here are a few more examples:

    * Given the starting numbers `1,3,2`, the `2020`th number spoken is `1`.
    * Given the starting numbers `2,1,3`, the `2020`th number spoken is `10`.
    * Given the starting numbers `1,2,3`, the `2020`th number spoken is `27`.
    * Given the starting numbers `2,3,1`, the `2020`th number spoken is `78`.
    * Given the starting numbers `3,2,1`, the `2020`th number spoken is `438`.
    * Given the starting numbers `3,1,2`, the `2020`th number spoken is `1836`.

Given your starting numbers, what will be the `2020`th number spoken?

Your puzzle input is `0,13,1,16,6,17`.

# Part Two
Impressed, the Elves issue you a challenge: determine the `30000000`th number spoken. For example, given the same starting numbers as above:

    * Given 0,3,6, the `30000000`th number spoken is `175594`.
    * Given 1,3,2, the `30000000`th number spoken is `2578`.
    * Given 2,1,3, the `30000000`th number spoken is `3544142`.
    * Given 1,2,3, the `30000000`th number spoken is `261214`.
    * Given 2,3,1, the `30000000`th number spoken is `6895259`.
    * Given 3,2,1, the `30000000`th number spoken is `18`.
    * Given 3,1,2, the `30000000`th number spoken is `362`.

**Given your starting numbers, what will be the `30000000`th number spoken?**



## Solution
### Rewrite the question in your own words:
The number game involves saying a number based on the previous numbers. If the previous number has not been said yet, you say `0`, if it has been said you say the number that is difference between the turns it was spoken (So if said turn 1 and then turn 4, you say `3`, the difference between the turns)

Following this pattern find the number that will be spoken on turn 2020

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* There will probably be lots of repeats, since `0` will always guarantee a repeat. That could set off a chain

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
* Interesting challenge, will have to store elements with a turn number (index seems best). Numbers can repeat. So if using a hash, would need to store the number as the value. Array is probably better, the main trick is to go backwards through the array to find the most recent number, not the first instance.

* For part two I will try a refactored solution using a hash, to help with look ups and performance. 


### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
Array seems best. We need to track turn number (index), the number spoken (element), and we need to track the order, which an array is ordered. The one performance issue is going backwards through the array to find the most recent number. Not sure if Ruby's `reverse` method is poor performance, not sure how it works under the hood. Don't have to worry about memory allocation either. Thanks, Ruby!

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Start the array with the inputs
build the method to follow the rules
Based on last element of the array
Reverse the array for searching
If there are no other occurrences, then push `0`
If there is another occurrence, subtract last element' index from last occurrence's index. (using find_index)
Loop that series until reach turn 2020
Return the 2020 (index 2019) number

### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?
