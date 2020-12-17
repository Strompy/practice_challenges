#  Day 17: Conway Cubes

As your flight slowly drifts through the sky, the Elves at the Mythical Information Bureau at the North Pole contact you. They'd like some help debugging a malfunctioning experimental energy source aboard one of their super-secret imaging satellites.

The experimental energy source is based on cutting-edge technology: a set of Conway Cubes contained in a pocket dimension! When you hear it's having problems, you can't help but agree to take a look.

The pocket dimension contains an infinite 3-dimensional grid. At every integer 3-dimensional coordinate (`x,y,z`), there exists a single cube which is either **active** or **inactive**.

In the initial state of the pocket dimension, almost all cubes start **inactive**. The only exception to this is a small flat region of cubes (your puzzle input); the cubes in this region start in the specified **active** (`#`) or **inactive** (`.`) state.

The energy source then proceeds to boot up by executing six **cycles**.

Each cube only ever considers its **neighbors**: any of the 26 other cubes where any of their coordinates differ by at most `1`. For example, given the cube at `x=1,y=2,z=3`, its neighbors include the cube at `x=2,y=2,z=2`, the cube at `x=0,y=2,z=3`, and so on.

During a cycle, **all** cubes **simultaneously** change their state according to the following rules:

    * If a cube is **active** and **exactly `2` or `3`** of its neighbors are also active, the cube remains **active**. Otherwise, the cube becomes **inactive**.
    * If a cube is **inactive** but **exactly `3`** of its neighbors are active, the cube becomes **active**. Otherwise, the cube remains **inactive**.

The engineers responsible for this experimental energy source would like you to simulate the pocket dimension and determine what the configuration of cubes should be at the end of the six-cycle boot process.

For example, consider the following initial state:
```
.#.
..#
###
```
Even though the pocket dimension is 3-dimensional, this initial state represents a small 2-dimensional slice of it. (In particular, this initial state defines a 3x3x1 region of the 3-dimensional space.)

Simulating a few cycles from this initial state produces the following configurations, where the result of each cycle is shown layer-by-layer at each given `z` coordinate (and the frame of view follows the active cells in each cycle):
```
Before any cycles:

z=0
.#.
..#
###


After 1 cycle:

z=-1
#..
..#
.#.

z=0
#.#
.##
.#.

z=1
#..
..#
.#.


After 2 cycles:

z=-2
.....
.....
..#..
.....
.....

z=-1
..#..
.#..#
....#
.#...
.....

z=0
##...
##...
#....
....#
.###.

z=1
..#..
.#..#
....#
.#...
.....

z=2
.....
.....
..#..
.....
.....


After 3 cycles:

z=-2
.......
.......
..##...
..###..
.......
.......
.......

z=-1
..#....
...#...
#......
.....##
.#...#.
..#.#..
...#...

z=0
...#...
.......
#......
.......
.....##
.##.#..
...#...

z=1
..#....
...#...
#......
.....##
.#...#.
..#.#..
...#...

z=2
.......
.......
..##...
..###..
.......
.......
.......
```
After the full six-cycle boot process completes, `112` cubes are left in the **active** state.

Starting with your given initial configuration, simulate six cycles. **How many cubes are left in the active state after the sixth cycle?**

# Part Two

## Solution
### Rewrite the question in your own words:
Given a 3-D, infinite grid, with active and inactive cubes, find the number active cubes at the end of six cycles, following these rules:
1) If a cube is **inactive** and **exactly 3** neighbors are active, it becomes **active**
2) If a cube is **active** and **2 or 3** neighbors are active, it remains active, otherwise it becomes **inactive**

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* The grid will expand with each turn
* Expands forward and backwards (every neighbor is 1, -1 in each plane)

### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
Since the grid expands endlessly and each cube starts at inactive, I don't have to build everything just set up a default value
hashes to store values for all directions

### How would you identify the elements of this problem?

- [ ] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [X] Build/Navigate a Grid
- [ ] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
Nested arrays work for 2D grids, 3d feels a little different. I can't shortcut and track just the three variables for one point either, have to know which cells are active throughout
I will know what I am looking up everytime (e.g 1x, -1x, 1y, -1y, 1z, -1z). So a hash may work. Location as the key and the value will be active or inactive.


### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Establish hash, default values as `false` or `.` or `inactive`
Parse inputs into the hash, starting with `000`
Then run the simulation, making an array of all the coords that will change
Check through the hash following the rules
check each neighbor (adding or subtract 1 from each axis)

once every neighbor has been checked, iterate through the array changing each coordinate

Repeat for 6 total turns

### Write out any implementation code OR link to repl

### What is the Big O complexity of your solution?
