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

@grid = test.clone

# Starting at 0,0 follow the pattern of right 3 down one (first move equal 1, 3)
row = 0
column = 0

def toboggan_ride(grid, row, column)
  position = grid[row][column]
  counter = 0
  until row >= grid.size
    counter += 1 if position == '#'
    column += 3
    row += 1
  end
  counter
end
# Check if spot is a tree `#` and count that or mark an X
# (Counting as we go would be better, so that we don't have to iterate through a second time to count `X`s)
# Continue until final row is counted (323 for full data)

require "pry"; binding.pry
  # test[0].each do |element|
  #   grid << element
  # end


  # Automatically build the full size grid
  # def self.set_grid_length(array)
  #   repeat_times = determine_grid_size(array)
  #   array.each do |row|
  #     repeat_times.times do |repeat|
  #       row.each do |element|
  #         @grid[row] << element
  #       end
  #     end
  #   end
  # end
  #
  # def self.determine_grid_size(array)
  #   height = array.size
  #   length = height * 3
  #   (length / array[0].size).round
  # end


# end
