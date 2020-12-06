part1 = 0
File.read("input.txt").split("\n\n").each do |line|
  tracker = Hash.new(0)
  line.delete("\n").chars.each do |char|
    tracker[char] += 1
  end
  part1 += tracker.size
end

puts "Total Answers: #{part1}"

part2 = 0
File.read("input.txt").split("\n\n").each do |line|
  tracker = Hash.new(0)
  party_size = line.count("\n") + 1
  line.delete("\n").chars.each do |char|
    tracker[char] += 1
  end
  tracker.each do |char, count|
    part2 += 1 if count == party_size
  end
end

puts "All Yes Answers: #{part2}"
