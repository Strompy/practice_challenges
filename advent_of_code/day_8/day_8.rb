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
  attr_accessor :instructions, :accumulator

  def initialize(instructions)
    @instructions = instructions
    @accumulator = 0
  end
  
  def acc(argument)

  end

  def jmp(argument)

  end

  def nop

  end

end
