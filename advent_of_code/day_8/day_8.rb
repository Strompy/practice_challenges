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
      require "pry"; binding.pry
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

  def change_instructions
    instructions.to_enum.with_index.reverse_each do |instruction, index|
      @accumulator = 0
      @current_instruction = 0
      changed = instructions.clone
      next if instruction.include?('acc')
      # require "pry"; binding.pry
      if instruction.include?('nop')
        changed[index] = instruction.gsub('nop', 'jmp')
      else
        changed[index] = instruction.include?('nop') ? instruction.gsub!('nop', 'jmp') : instruction.gsub!('jmp', 'nop')
      end
      read_instructions(changed)
      require "pry"; binding.pry
      return accumulator if current_instruction >= instruction.size
    end
    # code.each.with_index do |_, loc|
    #   next unless %i{jmp nop}.include?(code[loc][0])
    #
    #   code[loc][0] = code[loc][0] == :nop ? :jmp : :nop
    #   res = execute(code)
    #   code[loc][0] = code[loc][0] == :nop ? :jmp : :nop
    #
    #   puts "#{loc} - #{res}" if res
    # end
  end

  # def change_instructions
  #   last_neg_jmp = 0
  #   last_neg_jmp_index = 0
  #   instructions.each_with_index do |instruction, i|
  #     if instruction.include?('jmp -')
  #       last_neg_jmp_index, last_neg_jmp = i, instruction
  #     end
  #   end
  #   if executed[last_neg_jmp_index] == true
  #     print "changing last neg jmp to nop"
  #     @instructions[last_neg_jmp_index] = instructions[last_neg_jmp_index].gsub('jmp', 'nop')
  #     return
  #   end
  #
  #   instructions.to_enum.with_index.reverse_each do |instruction, i|
  #     if executed[i] && instruction.include?('nop') && (i + instruction[/\d+/].to_i) > last_neg_jmp_index
  #       instruction.gsub!('nop', 'jmp')
  #       print "change nop to jmp"
  #       return
  #     elsif !executed[i] && instruction.include?('jmp') && (i + instruction[/\d+/].to_i) > last_neg_jmp_index
  #       # a jmp that wasn't hit that would land you there, preceded by a jmp that was hit
  #       # (so by nopping the preceding jmp you hit the one that takes you to the end)
  #     end
  #   end
  # end
end

input = File.read("input.txt").split("\n")

gamebuddy = GameBuddy.new(input)
# puts 'Part 1:'
# puts gamebuddy.read_instructions
# puts 'Part 2:'
# gamebuddy.change_instructions
# puts gamebuddy.read_instructions



# Parser and lexer ;-)
code = File.readlines('input.txt')
         .map(&:split)
         .map { |is| [is[0].to_sym, is[1].to_i] }

# Interpreter
def execute(code, no_loops = false)
  pc = acc = cycles = 0
  coverage = []

  while (cycles += 1) < 1000
    return acc if pc >= code.length || (coverage[pc] && no_loops)
    coverage[pc] = true

    ins, op = code[pc]
    acc += op    if ins == :acc
    pc += op - 1 if ins == :jmp
    pc += 1
  end
end

# Run code for part one
puts execute(code, true)

# Change code for part two
code.each.with_index do |_, loc|
  next unless %i{jmp nop}.include?(code[loc][0])

  code[loc][0] = code[loc][0] == :nop ? :jmp : :nop
  res = execute(code)
  code[loc][0] = code[loc][0] == :nop ? :jmp : :nop

  puts "#{loc} - #{res}" if res
end
