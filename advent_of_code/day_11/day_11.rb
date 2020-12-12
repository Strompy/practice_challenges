seats = File.readlines('input.txt').map { |line| line.chomp.split('') }
# for checking adjacent seats
X_NAV = [ -1, 0, 1, 1, 1, 0, -1, -1 ]
Y_NAV = [ -1, -1, -1, 0, 1, 1, 1, 0 ]

height = (0...seats.size)
width = (0...seats[0].size)

def check_occupied_seats(seats, row, column, height, width)
  8.times.count do |i|
    adj_row = row + X_NAV[i]
    adj_column = column + Y_NAV[i]
    width.include?(adj_row) && height.include?(adj_column) && seats[adj_column][adj_row] == '#'
  end
end


def run_simulation(seats, height, width)
  loop do
    changed_seats = seats.clone
    height.each do |row|
      width.each do |column|
        if seats[row][column] == 'L'
          changed_seats[row][column] = '#' if check_occupied_seats(seats, row, column, height, width) == 0
        elsif seats[row][column] == '#'
          changed_seats[row][column] = 'L' if check_occupied_seats(seats, row, column, height, width) >= 4
        end
      end
    end
    break if seats == changed_seats
    seats = changed_seats
  end
  seats
end


puts "Part 1: "


results = run_simulation(seats, height, width)
puts results.join.count('#')



# data = IO.read('input.txt').lines.map(&:chomp)
# w = (0...data.first.length)
# h = (0...data.length)
#
# OX = [ -1, 0, 1, 1, 1, 0, -1, -1 ]
# OY = [ -1, -1, -1, 0, 1, 1, 1, 0 ]
#
# #
# # part 1
# #
#
# def nocc1(seats, x, y, w, h)
#   8.times.count do |i|
#     x2, y2 = x + OX[i], y + OY[i]
#     w.include?(x2) && h.include?(y2) && seats[y2][x2] == '#'
#   end
# end
#
# seats = data.map(&:dup)
# loop do
#   copy = seats.map(&:dup)
#   h.each do |y|
#     w.each do |x|
#       case seats[y][x]
#       when 'L' then copy[y][x] = '#' if nocc1(seats, x, y, w, h) == 0
#       when '#' then copy[y][x] = 'L' if nocc1(seats, x, y, w, h) >= 4
#       end
#     end
#   end
#   break if seats == copy
#   seats = copy
# end
# puts seats.join.count('#')
#
# def nocc2(seats, x, y, w, h)
#   0.upto(7).count do |i|
#     x2, y2, occ = x, y, false
#     loop do
#       x2, y2 = x2 + OX[i], y2 + OY[i]
#       break if !(w.cover?(x2) && h.cover?(y2))
#       case seats[y2][x2]
#       when 'L' then break
#       when '#' then occ = true ; break
#       end
#     end
#     occ
#   end
# end
#
# seats = data.map(&:dup)
# loop do
#   copy = seats.map(&:dup)
#   h.each do |y|
#     w.each do |x|
#       case seats[y][x]
#       when 'L' then copy[y][x] = '#' if nocc2(seats, x, y, w, h) == 0
#       when '#' then copy[y][x] = 'L' if nocc2(seats, x, y, w, h) >= 5
#       end
#     end
#   end
#   break if seats == copy
#   seats = copy
# end
# p seats.join.count('#')
