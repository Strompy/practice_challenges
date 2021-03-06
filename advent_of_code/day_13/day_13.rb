input = ['13','x','x','41','x','x','x','x','x','x','x','x','x','467','x','x','x','x','x','x','x','x','x','x','x','19','x','x','x','x','17','x','x','x','x','x','x','x','x','x','x','x','29','x','353','x','x','x','x','x','37','x','x','x','x','x','x','x','x','x','x','x','x','x','x','x','x','23']
ids = input.reduce([]) do |ids, id|
  ids << id.to_i if id != 'x'
  ids
end
earliest = 1008713
i = earliest
answer = nil

until !answer.nil? do
  ids.each do |id|
    if i % id == 0
      answer = id * (i - earliest)
    end
  end
  i += 1
end
puts "Part 1: #{answer}"
