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
    when 'N' then require "pry"; binding.pry
    when 'E' then require "pry"; binding.pry
    when 'S' then require "pry"; binding.pry
    when 'W' then require "pry"; binding.pry
    end
  end

end

boat = Boat.new(instructions)
print boat.navigate
