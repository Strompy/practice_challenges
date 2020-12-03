# Day 3: Toboggan Trajectory

With the toboggan login problems resolved, you set off toward the airport. While travel by toboggan might be easy, it's certainly not safe: there's very minimal steering and the area is covered in trees. You'll need to see which angles will take you near the fewest trees.

Due to the local geology, trees in this area only grow on exact integer coordinates in a grid. You make a map (your puzzle input) of the open squares (`.`) and trees (`#`) you can see. For example:

```
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
```

These aren't the only trees, though; due to something you read about once involving arboreal genetics and biome stability, the same pattern repeats to the right many times:

```
..##.........##.........##.........##.........##.........##.......  --->
#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....  --->
.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........#.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...##....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
```

You start on the open square (`.`) in the top-left corner and need to reach the bottom (below the bottom-most row on your map).

The toboggan can only follow a few specific slopes (you opted for a cheaper model that prefers rational numbers); start by *counting all the trees* you would encounter for the slope *right 3, down 1*:

From your starting position at the top-left, check the position that is right 3 and down 1. Then, check the position that is right 3 and down 1 from there, and so on until you go past the bottom of the map.

The locations you'd check in the above example are marked here with `O` where there was an open square and `X` where there was a tree:

```
..##.........##.........##.........##.........##.........##.......  --->
#..O#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
.#....X..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
..#.#...#O#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
.#...##..#..X...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.X#.......#.##.......#.##.......#.##.......#.##.....  --->
.#.#.#....#.#.#.#.O..#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........X.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.X#...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...#X....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...X.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
```

In this example, traversing the map using this slope would cause you to encounter `7` trees.

Starting at the top-left corner of your map and following a slope of right 3 and down 1, *how many trees would you encounter*?

# Part 2




### Rewrite the question in your own words:
Given the grid pattern that repeats ad infinitum to the right
Navigate through starting at the top left. moving to the right 3 and down 1
Count the number of `#` aka trees you encounter on the way to the bottom

### What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* The data set given is too tall for it's length, so the pattern will have to many times prior to reaching the bottom. In fact will have to move to the right `324*3` times.


### What are your initial thoughts about this problem? (high level design, 2-3 sentences)
* Each row pattern is 31 chars long. So they will have to repeat 32 times to get enough length
* Could mark an `X` for every tree, or could just count each time a `#` is encountered
* If arrays are full size, then can just increment indices until out of the grid (or last row)
* That is not dynamic, since I would have to hard code the repetitions. The code couldn't take any input


### How would you identify the elements of this problem?

- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [X] Build/Navigate a Grid
- [ ] Math
- [ ] Language API knowledge
- [ ] Optimization


### Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
* Nested arrays to form the grid. They are easy to navigate with index numbers. I could shovel in the pattern to create a bigger grid as necessary, or could set that at the start.
* Cons are performance related, these will be big arrays. Index numbers will be efficient to look up however

### Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
Take input lines and convert to nested arrays.
Starting at 0,0 follow the pattern of right 3 down one (first move equal 1, 3)
Check if spot is a tree `#` and count that or mark an X
(Counting as we go would be better, so that we don't have to iterate through a second time to count `X`s)
Continue until final row is counted (323 for full data)

### Write out any implementation code OR link to repl
See day_3.rb

### What is the Big O complexity of your solution?
