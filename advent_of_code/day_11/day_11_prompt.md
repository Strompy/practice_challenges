# Day 11: Seating System

Your plane lands with plenty of time to spare. The final leg of your journey is a ferry that goes directly to the tropical island where you can finally start your vacation. As you reach the waiting area to board the ferry, you realize you're so early, nobody else has even arrived yet!

By modeling the process people use to choose (or abandon) their seat in the waiting area, you're pretty sure you can predict the best place to sit. You make a quick map of the seat layout (your puzzle input).

The seat layout fits neatly on a grid. Each position is either floor (`.`), an empty seat (`L`), or an occupied seat `(#).` For example, the initial seat layout might look like this:

```
L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL
```

Now, you just need to model the people who will be arriving shortly. Fortunately, people are entirely predictable and always follow a simple set of rules. All decisions are based on the **number of occupied seats** adjacent to a given seat (one of the eight positions immediately up, down, left, right, or diagonal from the seat). The following rules are applied to every seat simultaneously:

    If a seat is **empty** (`L`) and there are **no** occupied seats adjacent to it, the seat becomes **occupied**.
    If a seat is **occupied** `(#)` and **four or more** seats adjacent to it are also occupied, the seat becomes **empty**.
    Otherwise, the seat's state does not change.

Floor (`.`) never changes; seats don't move, and nobody sits on the floor.

After one round of these rules, every seat in the example layout becomes occupied:

```
#.##.##.##
#######.##
#.#.#..#..
####.##.##
#.##.##.##
#.#####.##
..#.#.....
##########
#.######.#
#.#####.##
```

After a second round, the seats with four or more occupied adjacent seats become empty again:

```
#.LL.L#.##
#LLLLLL.L#
L.L.L..L..
#LLL.LL.L#
#.LL.LL.LL
#.LLLL#.##
..L.L.....
#LLLLLLLL#
#.LLLLLL.L
#.#LLLL.##
```

This process continues for three more rounds:

```
#.##.L#.##
#L###LL.L#
L.#.#..#..
#L##.##.L#
#.##.LL.LL
#.###L#.##
..#.#.....
#L######L#
#.LL###L.L
#.#L###.##
```

```
#.#L.L#.##
#LLL#LL.L#
L.L.L..#..
#LLL.##.L#
#.LL.LL.LL
#.LL#L#.##
..L.L.....
#L#LLLL#L#
#.LLLLLL.L
#.#L#L#.##
```

```
#.#L.L#.##
#LLL#LL.L#
L.#.L..#..
#L##.##.L#
#.#L.LL.LL
#.#L#L#.##
..L.L.....
#L#L##L#L#
#.LLLLLL.L
#.#L#L#.##
```

At this point, something interesting happens: the chaos stabilizes and further applications of these rules cause no seats to change state! Once people stop moving around, you count `37` occupied seats.

Simulate your seating area by applying the seating rules repeatedly until no seats change state. **How many seats end up occupied?**

# Part Two

As soon as people start to arrive, you realize your mistake. People don't just care about adjacent seats - they care about the **first seat they can see in each of those eight directions!**

Now, instead of considering just the eight immediately adjacent seats, consider the **first seat** in each of those eight directions. For example, the empty seat below would see **eight** occupied seats:

```
.......#.
...#.....
.#.......
.........
..#L....#
....#....
.........
#........
...#.....
```

The leftmost empty seat below would only see **one** empty seat, but cannot see any of the occupied ones:

```
.............
.L.L.#.#.#.#.
.............
```

The empty seat below would see **no** occupied seats:

```
.##.##.
#.#.#.#
##...##
...L...
##...##
#.#.#.#
.##.##.
```

Also, people seem to be more tolerant than you expected: it now takes **five or more visible** occupied seats for an occupied seat to become empty (rather than four or more from the previous rules). The other rules still apply: empty seats that see no occupied seats become occupied, seats matching no rule don't change, and floor never changes.

Given the same starting layout as above, these new rules cause the seating area to shift around as follows:

```
L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL
```
```
#.##.##.##
#######.##
#.#.#..#..
####.##.##
#.##.##.##
#.#####.##
..#.#.....
##########
#.######.#
#.#####.##
```
```
#.LL.LL.L#
#LLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLL#
#.LLLLLL.L
#.LLLLL.L#
```
```
#.L#.##.L#
#L#####.LL
L.#.#..#..
##L#.##.##
#.##.#L.##
#.#####.#L
..#.#.....
LLL####LL#
#.L#####.L
#.L####.L#
```
```
#.L#.L#.L#
#LLLLLL.LL
L.L.L..#..
##LL.LL.L#
L.LL.LL.L#
#.LLLLL.LL
..L.L.....
LLLLLLLLL#
#.LLLLL#.L
#.L#LL#.L#
```
```
#.L#.L#.L#
#LLLLLL.LL
L.L.L..#..
##L#.#L.L#
L.L#.#L.L#
#.L####.LL
..#.#.....
LLL###LLL#
#.LLLLL#.L
#.L#LL#.L#
```
```
#.L#.L#.L#
#LLLLLL.LL
L.L.L..#..
##L#.#L.L#
L.L#.LL.L#
#.LLLL#.LL
..#.L.....
LLL###LLL#
#.LLLLL#.L
#.L#LL#.L#
```

Again, at this point, people stop shifting around and the seating area reaches equilibrium. Once this occurs, you count `26` occupied seats.

Given the new visibility method and the rule change for occupied seats becoming empty, once equilibrium is reached, **how many seats end up occupied?**


## Solution
### Rewrite the question in your own words:
Take your map of the seats, `#` occupied, `L` open, and `.` floor.
Following the rules of seats changing state, at a certain point the map will stop changing
At that point How many seats are occupied?
Rules:
* An `L` seat, with no occupied `#` seats adjacent it switches to `#`
* A `#` occupied seat with four or more adjacent `#` occupied seats becomes `L` empty
* Floor never changes

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* It could be any range of rounds before the changes stop
* For the first rule, I assume a `.L.` pattern counts, since those are not occupied seats. Floor counts as not occupied seat
* Each change happens simultaneously, so if two open seats are together they both become filled together, not one after the other
* It seems like adjacent is the next closest seat in any direction, one of eight directions, up, down, left, right and 4 diagonals. Edge seats will have fewer

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
So with that adjacent rule, that makes this a grid problem. So nested arrays will be used. Can navigate with index numbers.
Will have to track changes somehow to make it all change at once and not as I go, since that would change the results
Make a copy of the seats array
Navigate through the copy, checking if seats hit criteria
change copy
break if seats == copy at the end

### How would you identify the elements of this problem?

- [ ] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [X] Build/Navigate a Grid
- [ ] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
So with that adjacent rule, that makes this a grid problem. So nested arrays will be used. Can navigate with index numbers. Will have to up the space complexity by making duplicates to check if there has been a change.

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Create navigation arrays, to check adjacent seats.
Parse input data into nested arrays
iterate over the data with index numbers.
Height and width are different sizes, keep that in mind
Define rules to check adjacent seats


### Write out any implementation code OR link to repl
See Day_11.rb


### What is the Big O complexity of your solution?
