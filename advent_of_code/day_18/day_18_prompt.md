# Day 18: Operation Order

As you look out the window and notice a heavily-forested continent slowly appear over the horizon, you are interrupted by the child sitting next to you. They're curious if you could help them with their math homework.

Unfortunately, it seems like this "math" follows different rules than you remember.

The homework (your puzzle input) consists of a series of expressions that consist of addition (+), multiplication (*), and parentheses ((...)). Just like normal math, parentheses indicate that the expression inside must be evaluated before it can be used by the surrounding expression. Addition still finds the sum of the numbers on both sides of the operator, and multiplication still finds the product.

However, the rules of **operator precedence** have changed. Rather than evaluating multiplication before addition, the operators have the **same precedence**, and are evaluated left-to-right regardless of the order in which they appear.

For example, the steps to evaluate the expression `1 + 2 * 3 + 4 * 5 + 6` are as follows:
```
1 + 2 * 3 + 4 * 5 + 6
  3   * 3 + 4 * 5 + 6
      9   + 4 * 5 + 6
         13   * 5 + 6
             65   + 6
                 71
```
Parentheses can override this order; for example, here is what happens if parentheses are added to form `1 + (2 * 3) + (4 * (5 + 6))`:
```
1 + (2 * 3) + (4 * (5 + 6))
1 +    6    + (4 * (5 + 6))
     7      + (4 * (5 + 6))
     7      + (4 *   11   )
     7      +     44
            51
```
Here are a few more examples:

    * `2 * 3 + (4 * 5)` becomes `26`.
    * `5 + (8 * 3 + 9 + 3 * 4 * 3)` becomes `437`.
    * `5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))` becomes `12240`.
    * `((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2` becomes `13632`.

Before you can help with the homework, you need to understand it yourself. **Evaluate the expression on each line of the homework; what is the sum of the resulting values?**

# Part Two
You manage to answer the child's questions and they finish part 1 of their homework, but get stuck when they reach the next section: **advanced math**.

Now, addition and multiplication have **different** precedence levels, but they're not the ones you're familiar with. Instead, addition is evaluated **before** multiplication.

For example, the steps to evaluate the expression `1 + 2 * 3 + 4 * 5 + 6` are now as follows:
```
1 + 2 * 3 + 4 * 5 + 6
  3   * 3 + 4 * 5 + 6
  3   *   7   * 5 + 6
  3   *   7   *  11
     21       *  11
         231
```
Here are the other examples from above:

    * `1 + (2 * 3) + (4 * (5 + 6))` still becomes `51`.
    * `2 * 3 + (4 * 5)` becomes `46`.
    * `5 + (8 * 3 + 9 + 3 * 4 * 3)` becomes `1445`.
    * `5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))` becomes `669060`.
    * `((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2` becomes `23340`.

**What do you get if you add up the results of evaluating the homework problems using these new rules?**

## Solution
### Rewrite the question in your own words:
Evaluate the math equations based on the rules that operations happen left to right, with parentheses being evaluated first.

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
Parse each string into it's own line for evaluating.
2 thoughts: Read left to write until hitting a parentheses or evaluate parantheses first and leaving the result in the place and then going left to right.
Could make a base method for evaluating left to right, then recursively evaluate parentheses by sending them back in
Probably need regex to grab parentheses sections

### How would you identify the elements of this problem?

- [ ] Searching of Data
- [ ] Sorting of Data
- [X] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?


### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Can move through the input string by char or index.
If a number convert to integer, then find the operator and do that with the next number.
If it is a parentheses, pull out that whole section and send it back through the method
Keep a running total for the left most item


### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?
