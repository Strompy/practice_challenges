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
    passport2 = {
      "iyr":"2013",
      "ecl":"amb",
      "cid":"350",
      "eyr":"2023",
      "pid":"028048884",
      "hcl":"#cfa07d",
      "byr":"1929"
    }
    passport3 = {
      "hcl":"#ae17e1",
      "iyr":"2013",
      "eyr":"2024",
      "ecl":"brn", "pid":"760753108",
      "byr":"1931",
      "hgt":"179cm"
    }
    passport4 = {
      "hcl":"#cfa07d",
      "eyr":"2025",
      "pid":"166559648",
      "iyr":"2011",
      "ecl":"brn",
      "hgt":"59in"
    }
    assert_equal true, check_valid(passport)
    assert_equal false, check_valid(passport2)
    assert_equal true, check_valid(passport3)
    assert_equal false, check_valid(passport4)
  end

  def check_number_of_valid_passports
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
    passport2 = {
      "iyr":"2013",
      "ecl":"amb",
      "cid":"350",
      "eyr":"2023",
      "pid":"028048884",
      "hcl":"#cfa07d",
      "byr":"1929"
    }
    passport3 = {
      "hcl":"#ae17e1",
      "iyr":"2013",
      "eyr":"2024",
      "ecl":"brn", "pid":"760753108",
      "byr":"1931",
      "hgt":"179cm"
    }
    passport4 = {
      "hcl":"#cfa07d",
      "eyr":"2025",
      "pid":"166559648",
      "iyr":"2011",
      "ecl":"brn",
      "hgt":"59in"
    }
    passports = [passport1, passport2, passport3, passport4]

    assert_equal 2, number_of_valid(passports)
  end
end
