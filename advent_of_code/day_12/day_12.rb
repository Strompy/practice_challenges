instructions = File.readlines('input.txt').map(&:chomp)


class Boat
  attr_reader :cardinals, :direction, :x, :y, :instructions

  def initialize(instructions)
    @cardinals = %i(north east south west)
    @direction = :east
    @x = 0
    @y = 0
    @instructions = instructions
    @waypoint = Struct.new(:north, :east).new(1, 10)
  end

  def navigate
    instructions.each do |inst|
      action, value = inst[0], inst[1..-1].to_i
      if action == 'L' || action == 'R'
        rotate(action, value)
      else
        move(action, value)
      end
    end
  end

  def rotate(action, value)
    turn = value / 90
    if action == 'R'
      new_direction = cardinals.find_index(direction) + turn
      @direction = cardinals[new_direction % 4]
    else
      new_direction = cardinals.find_index(direction) - turn
      @direction = cardinals[new_direction]
    end
  end

  def move(action, value)
    case action
    when 'N' then @x += value
    when 'E' then @y += value
    when 'S' then @x -= value
    when 'W' then @y -= value
    when 'F' then forward(value)
    end
  end

  def forward(value)
    @x += value if direction == :north
    @y += value if direction == :east
    @x -= value if direction == :south
    @y -= value if direction == :west
  end

  def manhattan_value
    x.abs + y.abs
  end

  def move_waypoint(direction, steps = 1)
    case direction
    when 'E' then @waypoint.east += steps
    when 'W' then @waypoint.east -= steps
    when 'N' then @waypoint.north += steps
    when 'S' then @waypoint.north -= steps
    end
  end

  # def move(direction, steps = 1)
  #   return move_waypoint(direction, steps) if direction != 'F'
  #
  #   raise 'Bad Direction' unless direction == 'F'
  # 
  #   @north += @waypoint.north * steps
  #   @east += @waypoint.east * steps
  # end
  #
  # def turn(by: 90)
  #   waypoint = Complex(@waypoint.north, @waypoint.east) * Complex('i') ** (by / 90)
  #   @waypoint.north, @waypoint.east = waypoint.real, waypoint.imaginary
  # end
end

boat = Boat.new(instructions)
boat.navigate
puts "Part 1: "
p boat.manhattan_value

boat_2 = Boat.new(instructions)
boat.navigate
puts "Part 2: "
p boat.manhattan_value
