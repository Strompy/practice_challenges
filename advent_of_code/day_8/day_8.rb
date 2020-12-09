class GameBuddy
  attr_accessor :instructions, :accumulator, :current_instruction

  def initialize(instructions)
    @instructions = instructions
    @accumulator = 0
    @current_instruction = 0
    @executed = {}
  end

  def read_instructions
    until current_instruction >= instructions.size
      index = current_instruction
      break if !@executed[index].nil?
      operator(instructions[index])
      @executed[index] = true
    end
    accumulator
  end

  def operator(instruction)
    operation, argument = instruction.split(' ')
    return accumulate(argument) if operation == 'acc'
    return jump(argument) if operation == 'jmp'
    return nope(argument) if operation == 'nop'
  end

  def accumulate(argument)
    if argument[0] == '+'
      @accumulator += argument[/\d+/].to_i
    elsif argument[0] == '-'
      @accumulator -= argument[/\d+/].to_i
    else
      return 'something is wrong'
    end
    @current_instruction += 1
  end

  def jump(argument)
    if argument[0] == '+'
      @current_instruction += argument[/\d+/].to_i
    elsif argument[0] == '-'
      @current_instruction -= argument[/\d+/].to_i
    else
      puts 'something is wrong'
    end
  end

  def nope(argument)
    @current_instruction += 1
  end
end

input = File.read("input.txt").split("\n")

gamebuddy = GameBuddy.new(input)
puts 'Part 1:'
puts gamebuddy.read_instructions
