require 'minitest/autorun'
require 'minitest/pride'
require './day_4'

class PassportTest < Minitest::Test
  def test_check_valid_passport
    passport = {
      "ecl" => "gry",
      "pid" => "860033327",
      "eyr" => "2020",
      "hcl" => "#fffffd",
      "byr" => "1937",
      "iyr" => "2017",
      "cid" => "147",
      "hgt" => "183cm"
    }
    passport2 = {
      "iyr" => "2013",
      "ecl" => "amb",
      "cid" => "350",
      "eyr" => "2023",
      "pid" => "028048884",
      "hcl" => "#cfa07d",
      "byr" => "1929"
    }
    passport3 = {
      "hcl" => "#ae17e1",
      "iyr" => "2013",
      "eyr" => "2024",
      "ecl" => "brn",
      "pid" => "760753108",
      "byr" => "1931",
      "hgt" => "179cm"
    }
    passport4 = {
      "hcl" => "#cfa07d",
      "eyr" => "2025",
      "pid" => "166559648",
      "iyr" => "2011",
      "ecl" => "brn",
      "hgt" => "59in"
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

  def test_check_extra_valid_passport
    byr1 = '2002'
    byr2 = '2003'

    iyr1 = '2010'
    iyr2 = '2021'

    eyr1 = '2020'
    eyr2 = '2000'

    hgt1 = '60in'
    hgt2 = '190cm'
    hgt3 = '190in'
    hgt4 = '190'

    hcl1 = '#123abc'
    hcl2 = '#123abz'
    hcl3 = '123abc'

    ecl1 = 'brn'
    ecl2 = 'wat'

    pid1 = '000000001'
    pid2 = '0123456789'

    assert_equal true, check_byr(byr1)
    assert_equal false, check_byr(byr2)

    assert_equal true, check_iyr(iyr1)
    assert_equal false, check_iyr(iyr2)

    assert_equal true, check_eyr(eyr1)
    assert_equal false, check_eyr(eyr2)

    assert_equal true, check_hgt(hgt1)
    assert_equal true, check_hgt(hgt2)
    assert_equal false, check_hgt(hgt3)
    assert_equal false, check_hgt(hgt4)

    assert_equal true, check_hcl(hcl1)
    assert_equal false, check_hcl(hcl2)
    assert_equal false, check_hcl(hcl3)

    assert_equal true, check_ecl(ecl1)
    assert_equal false, check_ecl(ecl2)

    # assert_equal true, check_pid(pid1)
    # assert_equal false, check_pid(pid2)
  end
end
