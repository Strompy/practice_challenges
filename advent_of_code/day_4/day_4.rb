passports = File.read("input.txt").split("\n\n").map do |passport|
  passport.scan(/(\w+{3})\:(\S+)/).to_h
end

EYE_COLORS = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

def check_valid(passport)
  return true if passport.keys.length == 8
  if passport.keys.length == 7 && passport.keys.include?("cid")
    return false
  elsif passport.keys.length == 7
    return true
  else
    return false
  end
end

def check_extra_valid(passport)
  if check_valid(passport) && valid_credentials?(passport)
    true
  else
    false
  end
end

def valid_credentials?(passport)
  check_byr(passport['byr']) &&
  check_iyr(passport['iyr']) &&
  check_eyr(passport['eyr']) &&
  check_hgt(passport['hgt']) &&
  check_hcl(passport['hcl']) &&
  check_pid(passport['pid'])
end

def check_byr(credential)
  credential.length == 4 && (1920..2002).include?(credential.to_i)
end

def check_iyr(credential)
  credential.length == 4 && (2010..2020).include?(credential.to_i)
end

def check_eyr(credential)
  credential.length == 4 && (2020..2030).include?(credential.to_i)
end

def check_hgt(credential)
  unit = credential[-2..-1]
  measure = credential[0..-3].to_i
  if unit == 'in' && (59..76).include?(measure)
    true
  elsif unit == 'cm' && (150..193).include?(measure)
    true
  else
    false
  end
end

def check_hcl(credential)
  if credential.match?(/\A#[0-9a-f]{6}\z/)
    true
  else
    false
  end
end

def check_ecl(credential)
  EYE_COLORS.include?(credential)
end

def check_pid(credential)
  credential.match?(/\A\d{9}\z/)
end

def number_of_valid(passports)
  passports.count do |passport|
    check_valid(passport)
  end
end

p number_of_valid(passports)

def number_of_extra_valid(passports)
  passports.count do |passport|
    check_extra_valid(passport)
  end
end

p number_of_extra_valid(passports)



# passports = File.read("input.txt").split("\n\n")
#
# passports.map! do |passport|
#   passport.scan(/(\w+{3})\:(\S+)/).to_h
# end
#
# puts passports.select { |passport|
#   (passport.keys & %w{byr iyr eyr hgt hcl ecl pid}).length == 7 &&
#   passport['byr'].to_i.between?(1920, 2002) &&
#   passport['iyr'].to_i.between?(2010, 2020) &&
#   passport['eyr'].to_i.between?(2020, 2030) &&
#   passport['hcl'] =~ /^\#[0-9a-f]{6}$/ &&
#   %w{amb blu brn gry grn hzl oth}.include?(passport['ecl']) &&
#   passport['pid'] =~ /^\d{9}$/ &&
#   (
#     (passport['hgt'].end_with?('cm') && passport['hgt'].to_i.between?(150, 193)) || (passport['hgt'].end_with?('in') && passport['hgt'].to_i.between?(59, 76))
#   )
# }.size
