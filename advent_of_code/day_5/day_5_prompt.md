# Day 5: Binary Boarding

You board your plane only to discover a new problem: you dropped your boarding pass! You aren't sure which seat is yours, and all of the flight attendants are busy with the flood of people that suddenly made it through passport control.

You write a quick program to use your phone's camera to scan all of the nearby boarding passes (your puzzle input); perhaps you can find your seat through process of elimination.

Instead of _zones or groups_, this airline uses **binary space partitioning** to seat people. A seat might be specified like `FBFBBFFRLR`, where `F` means "front", `B` means "back", `L` means "left", and `R` means "right".

The first 7 characters will either be `F` or `B`; these specify exactly one of the **128 rows** on the plane (numbered `0` through `127`). Each letter tells you which half of a region the given seat is in. Start with the whole list of rows; the first letter indicates whether the seat is in the **front** (`0` through `63`) or the **back** (`64` through `127`). The next letter indicates which half of that region the seat is in, and so on until you're left with exactly one row.

For example, consider just the first seven characters of `FBFBBFFRLR`:

    Start by considering the whole range, rows `0` through `127`.
    `F` means to take the **lower half**, keeping rows `0` through `63`.
    `B` means to take the **upper half**, keeping rows `32` through `63`.
    `F` means to take the **lower half**, keeping rows `32` through `47`.
    `B` means to take the **upper half**, keeping rows `40` through `47`.
    `B` keeps rows `44` through `47`.
    `F` keeps rows `44` through `45`.
    The final `F` keeps the lower of the two, row `44`.

The last three characters will be either `L` or `R`; these specify exactly one of the **8 columns** of seats on the plane (numbered `0` through `7`). The same process as above proceeds again, this time with only three steps. `L` means to keep the **lower half**, while `R` means to keep the **upper half**.

For example, consider just the last 3 characters of `FBFBBFFRLR`:

    Start by considering the whole range, columns `0` through `7`.
    `R` means to take the **upper half**, keeping columns `4` through `7`.
    `L` means to take the **lower half**, keeping columns `4` through `5`.
    The final `R` keeps the upper of the two, column `5`.

So, decoding `FBFBBFFRLR` reveals that it is the seat at row `44`, column `5`.

Every seat also has a unique **seat ID**: multiply the row by 8, then add the column. In this example, the seat has ID `44 * 8 + 5 = 357`.

Here are some other boarding passes:

    `BFFFBBFRRR`: row `70`, column `7`, seat ID `567`.
    `FFFBBBFRRR`: row `14`, column `7`, seat ID `119`.
    `BBFFBBFRLL`: row `102`, column `4`, seat ID `820`.

As a sanity check, look through your list of boarding passes. **What is the highest seat ID on a boarding pass?**

# Part 2

**Ding!** The "fasten seat belt" signs have turned on. Time to find your seat.

It's a completely full flight, so your seat should be the only missing boarding pass in your list. However, there's a catch: some of the seats at the very front and back of the plane don't exist on this aircraft, so they'll be missing from your list as well.

Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be in your list.

**What is the ID of your seat?**


### Rewrite the question in your own words:
Boarding passess have the seat denoted by a binary space partition.
to find the row, look through the F and B characters (first 7 of the seat)
f means front half, b means back half.
Based on the available rows split the available rows into the front or back half based on f or b, continue until down to one row.
The next 3 characters are for the seat/column. L for left half, r for right half. following the same pattern to locate the exact seat.
Then calculate the seat ID with the formula row * 8 + column
Find the largest seat ID

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* I assume there are no duplicate seats, but that may not matter since ultimately I am looking for the greatest seat ID.
* I will have to iterate through all the data, although if I am just trying to find the highest seat ID there may be a way to cut the data down. The bigger the row number the bigger the seat ID. so something like `BBBBBBB` would be the last most row and there for bigger than all other rows.
* The more Bs earlier in the code, the farther back the seat.
* similarly for the columns, `LLL` is the highest  number
* Maybe I can ignore seats that don't meet a baseline threshold of starting with `BB` and starting with at least `L`, although the addition of the column is small fish compared to multiplication

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
Convert data into an array
Could sort, but that would add a lot of complexity and time, that may not help much
Iterate through and find the highest seat values, ignoring certain parameters.
Do the math on every remaining seat and keep highest value

### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
I think I will use an array for the inputs. Easy to iterate over and I don't have any values to attach. Plus I probably have to look through all the data to an extent. Con is that iterating through will be linear time at the absolute best and will likely be greater based on my searching

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Input lines into an array
iterate through the data
If doesn't start with `BB` then move on
If meets criteria then calculate the row and column and seat ID. Store if greater than the last stored ID
Output seat ID

After some research it looks like it is a binary exercise, so I will convert the passes into binary based on their letters, F and L for 0, B and R for 1

### Write out any implementation code OR link to repl
See day_5.rb

### What is the Big O complexity of your solution?
