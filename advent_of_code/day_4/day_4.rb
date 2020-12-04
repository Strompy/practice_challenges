# passport = {}
# passpoorts = []
# inputs = File.readlines("input.txt").each do |line|
#   require "pry"; binding.pry
#   if line == "\n"
#     passports << passport
#     passport = Hash.new
#   end
#   passport
# end

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

def number_of_valid(passports)
  passports.count do |passport|
    check_valid(passport)
  end
end

p number_of_valid(passports)
