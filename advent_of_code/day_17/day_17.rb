coordinates = {}
File.read("input.txt").split("\n").each.with_index do |row, row_index|
  row.chars.each.with_index do |column, col_index|
    require "pry"; binding.pry
    coordinates[[row_index, col_index, 0]] = column == '#'
  end
end

require "pry"; binding.pry
