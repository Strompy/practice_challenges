coordinates = Hash.new
File.read("input.txt").split("\n").each.with_index do |row, row_index|
  row.chars.each.with_index do |column, col_index|
    coordinates[[row_index, col_index, 0]] = column == '#'
  end
end


directions = [0, -1, 1]
neighbors = directions.product(*Array.new(coordinates.first.first.length - 1, directions))
neighbors.shift

def count_neighbors(neighbors, coordinate, coordinates, to_make)
  neighbors.count do |n|
    cube = [n, coordinate].transpose.map {|x| x.reduce(:+)}
    to_make << cube if coordinates[cube].nil?
    # coordinates[cube] ||= false
    coordinates[cube] == true
  end
end

6.times do |i|
  to_change = []
  to_make = []
  coordinates.each do |coord, bool|
    count = count_neighbors(neighbors, coord, coordinates, to_make)
    if bool == true
      next if count == 2 || count == 3
      to_change << coord
    elsif bool == false && count == 3
      to_change << coord
    end
  end

  to_change.each do |coord|
    coordinates[coord] = !coordinates[coord]
  end

  to_make.each do |coord|
    coordinates[coord] = false
  end
# require "pry"; binding.pry
end

puts coordinates.values.count { |c| c == true }
require "pry"; binding.pry
