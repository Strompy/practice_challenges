tiles = Hash.new

File.read('input.txt').split("\n\n").each do |chunk|
  l = chunk.lines.map(&:chomp)
  tiles[l.first[/\d+/].to_i] = l[1..-1].map(&:chars)
end
require "pry"; binding.pry
