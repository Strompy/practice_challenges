# Part 1
test = [
  ['.','.','#','#','.','.','.','.','.','.','.'],
  ['#','.','.','.','#','.','.','.','#','.','.'],
  ['.','#','.','.','.','.','#','.','.','#','.'],
  ['.','.','#','.','#','.','.','.','#','.','#'],
  ['.','#','.','.','.','#','#','.','.','#','.'],
  ['.','.','#','.','#','#','.','.','.','.','.'],
  ['.','#','.','#','.','#','.','.','.','.','#'],
  ['.','#','.','.','.','.','.','.','.','.','#'],
  ['#','.','#','#','.','.','.','#','.','.','.'],
  ['#','.','.','.','#','#','.','.','.','.','#'],
  ['.','#','.','.','#','.','.','.','#','.','#']
]

slopes = {
  one: {1 => 1},
  two: {3 => 1},
  three: {5 => 1},
  four: {7 => 1},
  five: {1 => 2}
}

grid = []
File.readlines("input.txt").each_with_index do |line, i|
  grid[i] = line.chomp
end

row = 0
column = 0

def toboggan_ride(grid, row, column, right, down)
  counter = 0
  length = grid[0].size
  until row >= grid.size
    if grid[row][column].nil?
      column -= length
    end
    counter += 1 if grid[row][column] == '#'
    column += right
    row += down
  end
  counter
end


trees = []
slopes.each do |number, slope|
  slope.each do |right, down|
    trees << toboggan_ride(grid, row, column, right, down)
  end
end
puts trees
p trees.inject(:*)
