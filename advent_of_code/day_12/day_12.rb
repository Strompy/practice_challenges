instructions = File.readlines('input.txt').map(&:chomp)


class Boat
  attr_reader :cardinals, :direction, :x, :y, :instructions

  def initialize(instructions)
    @cardinals = %i(north east south west)
    @direction = :east
    @x = 0
    @y = 0
    @instructions = instructions
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
      new_direction = cardinals.find_index(:east) + turn
      @direction = cardinals[new_direction % 4]
    else
      new_direction = cardinals.find_index(:east) - turn
      @direction = cardinals[new_direction % 4]
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

end

boat = Boat.new(instructions)
boat.navigate
require "pry"; binding.pry
# print boat.x + boat.y
