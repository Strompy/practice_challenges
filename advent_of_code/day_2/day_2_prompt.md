# Day 2: Password Philosophy

Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan.

The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look.

Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen.

To try to debug the problem, they have created a list (your puzzle input) of *passwords* (according to the corrupted database) and *the corporate policy when that password was set*.

For example, suppose you have the following list:

```
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
```

Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, `1-3 a` means that the password must contain `a` at least `1` time and at most `3` times.

In the above example, 2 passwords are valid. The middle password, `cdefg`, is not; it contains no instances of `b`, but needs at least `1`. The first and third passwords are valid: they contain one `a` or nine `c`, both within the limits of their respective policies.

How many passwords are valid according to their policies?

## Part 2

While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting.

The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently.

Each policy actually describes two *positions in the password*, where `1` means the first character, `2` means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) *Exactly one of these positions* must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

Given the same example list from above:

* `1-3 a: abcde` is valid: position `1` contains `a` and position `3` does not.
* `1-3 b: cdefg` is invalid: neither position `1` nor position `3` contains `b`.
* `2-9 c: ccccccccc` is invalid: both position `2` and position `9` contain `c`.

*How many passwords are valid* according to the new interpretation of the policies?


___
## Solution

### Rewrite the question in your own words:
In the input there is a policy and a pass word. The policy defines the range of times that the specific letter must appear in the password. Find the total number of passwords that are valid according to their policy.

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* Valid passwords could be 0 or all
* I'll test with a smaller data set, the sample given and then try the full set. The same solution should be able to handle several sizes of input


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
* Take the first part of the policy and convert that to a range.
* Take the second part of the policy (letter) and set that as the search object
* Search through the password for the letter, counting number of times it appears
* Check if that number is within the range
* Profit

### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
* Range for the number, it should be easy to create and easy to check if the count is within
* Hash for the inputs. I need the policy and the passwords together and accessed at the same time. Iterating through the hash will easily give me both. And I have to check each input, so there is no unnecessary loss of efficiency by iterating

* Had to pivot from the hash, my readlines to hash method was not converting all the lines into hashes for some reason, I was only getting 780 some lines converted. Now the method converts each into a array of pairs.

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Take inputs and convert to hash with the policy as the key and the password as the value
Iterate through that hash
Inside break the key into two parts
range is based on the range in the policy
letter is the letter following the range
Count the number of times the letter appears in the password
Check if that count is within in the range
If so, increment the total_count by one

### Write out any implementation code OR link to repl
See day_2.rb

### What is the Big O complexity of your solution?
Part 1 is O(n) for the iteration, and then the count method in each one is O(n), so O(n*m) maybe
