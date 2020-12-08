# Day 8: Handheld Halting

Your flight to the major airline hub reaches cruising altitude without incident. While you consider checking the in-flight menu for one of those drinks that come with a little umbrella, you are interrupted by the kid sitting next to you.

Their handheld game console won't turn on! They ask if you can take a look.

You narrow the problem down to a strange **infinite loop** in the boot code (your puzzle input) of the device. You should be able to fix it, but first you need to be able to run the code in isolation.

The boot code is represented as a text file with one **instruction** per line of text. Each instruction consists of an **operation** (`acc`, `jmp`, or `nop`) and an **argument** (a signed number like `+4` or `-20`).

    * `acc` increases or decreases a single global value called the **accumulator** by the value given in the argument. For example, `acc +7` would increase the accumulator by 7. The accumulator starts at `0`. After an `acc` instruction, the instruction immediately below it is executed next.
    * `jmp` **jumps** to a new instruction relative to itself. The next instruction to execute is found using the argument as an **offset** from the `jmp` instruction; for example, `jmp +2` would skip the next instruction, `jmp +1` would continue to the instruction immediately below it, and `jmp -20` would cause the instruction 20 lines above to be executed next.
    * `nop` stands for **No OPeration** - it does nothing. The instruction immediately below it is executed next.

For example, consider the following program:

```
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
```

These instructions are visited in this order:

```
nop +0  | 1
acc +1  | 2, 8(!)
jmp +4  | 3
acc +3  | 6
jmp -3  | 7
acc -99 |
acc +1  | 4
jmp -4  | 5
acc +6  |
```

First, the `nop +0` does nothing. Then, the accumulator is increased from 0 to 1 (`acc +1`) and `jmp +4` sets the next instruction to the other `acc +1` near the bottom. After it increases the accumulator from 1 to 2, `jmp -4` executes, setting the next instruction to the only `acc +3`. It sets the accumulator to 5, and `jmp -3` causes the program to continue back at the first `acc +1`.

This is an **infinite loop**: with this sequence of jumps, the program will run forever. The moment the program tries to run any instruction a second time, you know it will never terminate.

Immediately **before** the program would run an instruction a second time, the value in the accumulator is `5`.

Run your copy of the boot code. Immediately before any instruction is executed a second time, **what value is in the accumulator**?

# Part Two


# Solution
### Rewrite the question in your own words:
Following the instructions of the program, find the value of the accumulator prior to an instruction being executed a second time.

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* Could repeat at any time, 2 lines or 641.
* I am assuming it will repeat at some point, otherwise the accumulator will just be the value at the end of execution.
* Possible that it could jump to an empty line at the end of the input, that will also count as the end of execution.

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
* First thought, track if a line has been executed with a hash. If it is in the hash, that breaks the program and outputs in the accumulator, if not already in the hash, then it gets added. I guess a set might work, but I don't know the details of those yet.
* I'll have to code the rules for the instructions

### How would you identify the elements of this problem?

- [ ] Searching of Data
- [ ] Sorting of Data
- [X] Pattern Recognition
- [ ] Build/Navigate a Grid
- [ ] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
I'm thinking a hash to track which lines have been run. Some line tracking number as the key, and then could be a boolean or a 1 for the value. Either way, if the key exists in the hash, then that means it has been run previously.
Compiling the code could just be an array. Index numbers would be easy for the hash key, and for following the rules of the code. (jmp -3 means go back three index numbers). Something like a linked list might work, but I haven't really used those.

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Parse input data into array
Write out the what to do based on the rules
Write how to parse instruction (command and value e.g. acc +2)
Then run through the array, following the rules
Track which instructions have been run with the hash
If the hash[current_instruction] (based on index number) exists then don't run the command, instead end and output the accumulator.


### Write out any implementation code OR link to repl
See day_8.rb


### What is the Big O complexity of your solution?
