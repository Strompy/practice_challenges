contained_by = Hash.new

File.readlines('input.txt').each do |line|
  bag, rules = line.chomp.split(' bags contain')
  contained_by[bag] = rules.delete_suffix('.').split(',').map do |rule|
    details = rule.match(/(?<count>\d+) (?<color>.+) bags?/)
    if rule.include?("no other bags")
       {}
    else
       {
        "count" => details[:count],
        "color" => details[:color]
      }
    end
  end
end

def bags_holding(contained_by, color, tracker)
  contained_by.each do |bag, rules|
    rules.each do |rule|
      if rule['color'] == color
        tracker << bag
        bags_holding(contained_by, bag, tracker)
      end
    end
  end
  tracker
end

def total_bags(contained_by, color)
  total = 1
  contained_by[color].each do |rule|
    unless rule == {}
      total += rule['count'].to_i * total_bags(contained_by, rule['color'])
    end
  end
  total
end

bags = []
puts bags_holding(contained_by, 'shiny gold', bags).uniq.size
puts total_bags(contained_by, 'shiny gold') - 1
