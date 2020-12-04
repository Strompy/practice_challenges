require 'minitest/autorun'
require 'minitest/pride'
require './day_4'

class PassportTest < Minitest::Test
  def test_check_valid_passport
    passport = {
      "ecl":"gry",
      "pid":"860033327",
      "eyr":"2020",
      "hcl":"#fffffd",
      "byr":"1937",
      "iyr":"2017",
      "cid":"147",
      "hgt":"183cm"
    }
    assert_equal true, check_valid(passport)
  end
end
