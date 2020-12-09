class GameBuddy
  attr_accessor :instructions, :accumulator, :current_instruction, :executed

  def initialize(instructions)
    @instructions = instructions
    @accumulator = 0
    @current_instruction = 0
    @executed = {}
  end

  def read_instructions(instructions)
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
    if argument[/\d+/].to_i == 0
      require "pry"; binding.pry
      @current_instruction += 1
    elsif argument[0] == '+'
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

  def change_instructions
    instructions.to_enum.with_index.reverse_each do |instruction, index|
      @accumulator = 0
      @current_instruction = 0
      @executed = {}
      changed = instructions.clone
      next if instruction.include?('acc')
      if instruction.include?('nop')
        changed[index] = instruction.gsub('nop', 'jmp')
      else
        changed[index] = instruction.gsub('jmp', 'nop')
      end
      read_instructions(changed)
      break if current_instruction >= instructions.size
    end
  end
end

input = File.read("input.txt").split("\n")

gamebuddy = GameBuddy.new(input)
puts 'Part 1:'
puts gamebuddy.read_instructions(input)
puts 'Part 2:'
gamebuddy.change_instructions
puts gamebuddy.accumulator



# # Parser and lexer ;-)
# code = File.readlines('input.txt')
#          .map(&:split)
#          .map { |is| [is[0].to_sym, is[1].to_i] }
#
# # Interpreter
# def execute(code, no_loops = false)
#   pc = acc = cycles = 0
#   coverage = []
#
#   while (cycles += 1) < 1000
#     return acc if pc >= code.length || (coverage[pc] && no_loops)
#     coverage[pc] = true
#
#     ins, op = code[pc]
#     acc += op    if ins == :acc
#     pc += op - 1 if ins == :jmp
#     pc += 1
#   end
# end
#
# # Run code for part one
# puts execute(code, true)
#
# # Change code for part two
# code.each.with_index do |_, loc|
#   next unless %i{jmp nop}.include?(code[loc][0])
#
#   code[loc][0] = code[loc][0] == :nop ? :jmp : :nop
#   res = execute(code)
#   code[loc][0] = code[loc][0] == :nop ? :jmp : :nop
#
#   puts "#{loc} - #{res}" if res
# end
