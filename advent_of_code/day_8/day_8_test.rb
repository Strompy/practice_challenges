require 'minitest/autorun'
require 'minitest/pride'
require './day_8'

class GameBuddyTest < Minitest::Test
  def setup
    @test = ['nop +0',
    'acc +1',
    'jmp +4',
    'acc +3',
    'jmp -3',
    'acc -99',
    'acc +1',
    'jmp -4',
    'acc +6']

    @gameboy = GameBuddy.new(@test)
  end
  def test_it_exists_with_attributes
    test = ['nop +0',
    'acc +1',
    'jmp +4',
    'acc +3',
    'jmp -3',
    'acc -99',
    'acc +1',
    'jmp -4',
    'acc +6']

    console = GameBuddy.new(test)
    assert_instance_of GameBuddy, console
    assert_equal test, console.instructions
    assert_equal 0, console.accumulator
    assert_equal 0, console.current_instruction
  end

  def test_it_can_accumulate
    assert_equal 0, @gameboy.accumulator

    @gameboy.accumlate('+2')
    assert_equal 2, @gameboy.accumulator
  end

  def test_it_can_jump
    assert_equal 0, @gameboy.current_instruction

    @gameboy.jump('+2')
    assert_equal 2, @gameboy.current_instruction

    @gameboy.jump('-1')
    assert_equal 1, @gameboy.current_instruction
  end

  def test_it_can_operation
    assert_equal 0, @gameboy.accumulator
    @gameboy.accumlate('+2')

    assert_equal 2, @gameboy.accumulator
  end
end
