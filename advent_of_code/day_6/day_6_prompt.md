# Day 6: Custom Customs

As your flight approaches the regional airport where you'll switch to a much larger plane, customs declaration forms are distributed to the passengers.

The form asks a series of 26 yes-or-no questions marked `a` through `z`. All you need to do is identify the questions for which **anyone in your group** answers "yes". Since your group is just you, this doesn't take very long.

However, the person sitting next to you seems to be experiencing a language barrier and asks if you can help. For each of the people in their group, you write down the questions for which they answer "yes", one per line. For example:

`abcx`
`abcy`
`abcz`

In this group, there are **6** questions to which anyone answered "yes": `a`, `b`, `c`, `x`, `y`, and `z`. (Duplicate answers to the same question don't count extra; each question counts at most once.)

Another group asks for your help, then another, and eventually you've collected answers from every group on the plane (your puzzle input). Each group's answers are separated by a blank line, and within each group, each person's answers are on a single line. For example:

```
abc

a
b
c

ab
ac

a
a
a
a

b
```

This list represents answers from five groups:

    The first group contains one person who answered "yes" to `3` questions: `a`, `b`, and `c`.
    The second group contains three people; combined, they answered "yes" to `3` questions: `a`, `b`, and `c`.
    The third group contains two people; combined, they answered "yes" to `3` questions: `a`, `b`, and `c`.
    The fourth group contains four people; combined, they answered "yes" to only `1` question, `a`.
    The last group contains one person who answered "yes" to only `1` question, `b`.

In this example, the sum of these counts is `3 + 3 + 3 + 1 + 1 = 11`.

For each group, count the number of questions to which anyone answered "yes". **What is the sum of those counts?**

# Part 2


## Solution
### Rewrite the question in your own words:
Count the number of questions that have at least one 'yes' answer per group
Then sum the total off all counts

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* All or none of the questions could be answered "yes"
* Groups can be of any size
* Answer letters are not alphabetical, could be any random pattern
* For part one at least, I don't care about duplicate answers. I have a feeling part 2 will change that

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
Pull in data and split into groups based on `\n\n`
I could try filtering out duplicates and then counting the remaining chars
Or I could put into a hash with the key being the letter and the value being the count for that letter
Then count the total keys. I like that idea more

### How would you identify the elements of this problem?

- [ ] Searching of Data
- [X] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
I will start with a hash. That way I can store the count of particular letter in the value and I can easily get the sum of answered questions with the count of keys.

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Read input text, splitting by double line break
in each line, organize the letters into a hash
Add size of the hash to the counter
Store the hashes in an array? If I count as I go, I don't have to store the hashes. But that does make troubleshooting tougher.
Return the counter

### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?
