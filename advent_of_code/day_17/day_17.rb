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
    coordinates[cube] == true
  end
end


6.times do |i|
  # new_state = {}
  to_change = []
  to_make = []
  coordinates.each do |coord, bool|
    count = count_neighbors(neighbors, coord, coordinates, to_make)
    if bool == true
      if count == 2 || count == 3
        # new_state[coord] = true
      else
        to_change << coord
        # new_state[coord] = false
      end
    elsif bool == false && count == 3
      to_change << coord
      # new_state[coord] = true
    # else
      # new_state[coord] = bool
    end
  end
# require "pry"; binding.pry
  # new_state = coordinates
# require "pry"; binding.pry
  to_change.each do |coord|
    coordinates[coord] = !coordinates[coord]
  end
# require "pry"; binding.pry
  to_make.each do |coord|
    coordinates[coord] = false
  end
# require "pry"; binding.pry
end

puts coordinates.values.count { |c| c == true } #answer 353
# require "pry"; binding.pry

space = Hash.new('.')
File.read('input.txt').lines.map(&:chomp).each.with_index do |row, x|
  row.each_char.with_index { |c, y| space[[ x, y, 0, 0 ]] = c }
end

6.times do
  copy = space.dup

  # bounds
  coords = space.keys
  mx, nx = coords.map { |c| c[0] }.min - 1, coords.map { |c| c[0] }.max + 1
  my, ny = coords.map { |c| c[1] }.min - 1, coords.map { |c| c[1] }.max + 1
  mz, nz = coords.map { |c| c[2] }.min - 1, coords.map { |c| c[2] }.max + 1
  mw, nw = coords.map { |c| c[3] }.min - 1, coords.map { |c| c[3] }.max + 1

  # advance
  mx.upto(nx).each do |x|
    my.upto(ny).each do |y|
      mz.upto(nz).each do |z|
        mw.upto(nw).each do |w|
          adj = 0
          -1.upto(1).each do |dx|
            -1.upto(1).each do |dy|
              -1.upto(1).each do |dz|
                -1.upto(1).each do |dw|
                  next if dx == 0 && dy == 0 && dz == 0 && dw == 0
                  adj += 1 if space[[ x + dx, y + dy, z + dz, w + dw ]] == '#'
                end
              end
            end
          end

          copy[[ x, y, z, w ]] = case space[[ x, y, z, w ]]
          when '#' then [ 2, 3 ].include?(adj) ? '#' : '.'
          when '.' then adj == 3 ? '#' : '.'
          end
        end
      end
    end
  end
  space = copy
end
p space.values.count { |c| c == '#' }
