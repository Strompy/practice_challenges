passports = File.read("input.txt").split("\n\n").map do |passport|
  passport.scan(/(\w+{3})\:(\S+)/).to_h
end


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
  return true if passport.keys.length == 8
  if passport.keys.length == 7 && passport.keys.include?("cid")
    return false
  elsif passport.keys.length == 7
    return true
  else
    return false
  end
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
  require "pry"; binding.pry

end

def check_pid(credential)

end

def number_of_valid(passports)
  passports.count do |passport|
    check_valid(passport)
  end
end

p number_of_valid(passports)
