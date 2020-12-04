test = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in"


def check_valid(passport)
  return true if passport.keys.length == 8
  if passport.keys.length == 7 && passport.keys.include?(:cid)
    return false
  elsif passport.keys.length == 7
    return true
  else
    return false
  end
end

def number_of_valid(passports)
  passports.count do |passport|
    check_valid(passport)
  end
end
