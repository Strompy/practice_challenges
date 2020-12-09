test = ['nop +0',
'acc +1',
'jmp +4',
'acc +3',
'jmp -3',
'acc -99',
'acc +1',
'jmp -4',
'acc +6']


class GameBuddy
  attr_accessor :instructions, :accumulator, :current_instruction

  def initialize(instructions)
    @instructions = instructions
    @accumulator = 0
    @current_instruction = 0
  end

  def operator(instruction)
    operation, argument = intruction.split(' ')
    return accumulate(argument) if operation == 'acc'
    return jump(argument) if operation == 'jmp'
    return nope(argument) if operation == 'nop'
    # helper method to parse data?
    # run instruction based on which operation is passed
  end

  def accumlate(argument)
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
