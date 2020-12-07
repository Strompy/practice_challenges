contained_by = Hash.new

File.readlines('test.txt').each do |line|
  bag, rules = line.chomp.split(' bags contain')
  if rules.include?("no other bags")
    contained_by[bag] ||= []
    next
  end
  rules.delete_suffix('.').split(',').each do |rule|
    contained_by[bag] ||= []
    details = rule.match(/(?<count>\d+) (?<color>.+) bags?/)
    contained_by[bag] << details[:color]
  end
end
require "pry"; binding.pry
