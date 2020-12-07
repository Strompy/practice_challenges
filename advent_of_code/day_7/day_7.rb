contained_by = Hash.new
holds = Hash.new

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
    # contained_by[bag] ||= []
    # contained_by[bag] << details[:color]
    # holds[details[:color]] ||= []
    # holds[details[:color]] << bag
  end
end
# require "pry"; binding.pry
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

bags = []
puts bags_holding(contained_by, 'shiny gold', bags).uniq.size
