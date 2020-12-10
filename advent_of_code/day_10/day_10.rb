data = File.read("input.txt").split.map(&:to_i).sort
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

def dp(adapters, hash, n)
  return 1 if n == 0
  return 0 if !adapters.include?(n)
  hash[n] ||= (1..3).sum { |x| dp(adapters, hash, n - x) }
end
print "Part 2: "
p dp(data, {}, data.last)
