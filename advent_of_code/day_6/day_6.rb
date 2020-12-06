counter = 0
File.read("input.txt").split("\n\n").each do |line|
  tracker = Hash.new(0)
  line.delete("\n").chars.each do |char|
    tracker[char] += 1
  end
  counter += tracker.size
end

puts "Total Answers: #{counter}"
