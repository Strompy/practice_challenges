seats = File.readlines('test.txt').map { |line| line.chomp.split('') }
# for checking adjacent seats
X_NAV = [ -1, 0, 1, 1, 1, 0, -1, -1 ]
Y_NAV = [ -1, -1, -1, 0, 1, 1, 1, 0 ]

height = [0...seats.size]
width = [0...seats[0].size]

def check_occupied_seats(seats, row, column, height, width)
  8.times.count do |i|
    adj_row = row + X_NAV[i]
    adj_column = column + Y_NAV[i]
    width.include?(adj_row) && height.include?(adj_column) && seats[adj_row][adj_column] == '#'
  end
end

p check_occupied_seats(seats, 0, 0, height, width)
