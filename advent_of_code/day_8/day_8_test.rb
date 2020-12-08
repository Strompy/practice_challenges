require 'minitest/autorun'
require 'minitest/pride'
require './day_8'

class GameBuddyTest < Minitest::Test
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
  end

end
