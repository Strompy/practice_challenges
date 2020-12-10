data = File.read("input.txt").split("\n").map(&:to_i).sort
data.unshift(0)
data << (data.last + 3)

def part1(data)
  accumulator = Hash.new(0)
  data.each_cons(2) do |a, b|
    accumulator[b - a] += 1
  end
  accumulator[1] * accumulator[3]
end
print "Part 1: "
p part1(data)
