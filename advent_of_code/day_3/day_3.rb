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
# class TobogganRide

grid = []
File.readlines("input.txt").each_with_index do |line, i|
  grid[i] = line.chomp
end

# Starting at 0,0 follow the pattern of right 3 down one (first move equal 1, 3)
row = 0
column = 0

def toboggan_ride(grid, row, column)
  position = grid[row][column]
  counter = 0
  length = grid[0].size
  until row >= grid.size
    if grid[row][column].nil?
      column -= length
    end
    counter += 1 if grid[row][column] == '#'
    column += 3
    row += 1
  end
  counter
end

puts toboggan_ride(grid, row, column)
