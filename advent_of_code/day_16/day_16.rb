fields = Hash.new
your_ticket = []
tickets = []

current_section = 'fields'
File.readlines('input.txt').each do |line|
  next if line == "\n"
  if line.include?('your ticket')
    current_section = 'yours'
    next
  end
  if line.include?('nearby')
    current_section = 'tickets'
    next
  end
  if current_section == 'fields'
    field, value = line.chomp.split(': ')
    range1, range2 = value.split('or').flat_map { |a| a.split("-") }.map(&:to_i).each_slice(2).to_a
    fields[field] = [range1, range2]
  elsif current_section == 'yours'
    your_ticket = line.chomp.split(',').map(&:to_i)
  elsif current_section == 'tickets'
    tickets << line.chomp.split(',').map(&:to_i)
  end
end


invalid = tickets.flat_map do |ticket|
  ticket.select do |value|
    fields.values.none? do |range1, range2|
      value.between?(*range1) || value.between?(*range2)
    end
  end
end
puts "Part 1: #{invalid.sum}"

valids = tickets.reject do |ticket|
  ticket.any? do |value|
    fields.values.none? do |range1, range2|
      value.between?(*range1) || value.between?(*range2)
    end
  end
end

# require "pry"; binding.pry


fields_to_positions = {}
fields.each do |name, ranges|
  positions = (0...(valids[0].size)).to_a.select do |i|
    valids.all? do |ticket|
      ticket[i].between?(*ranges[0]) || ticket[i].between?(*ranges[1])
    end
  end
  fields_to_positions[name] = positions
end
# require "pry"; binding.pry

until fields_to_positions.values.all?(&:one?) do
  pos_to_remove = fields_to_positions.select { |_, ps| ps.one? }.map(&:last).flatten
  names_to_remove_from = fields_to_positions.reject { |_, ps| ps.one? }.map(&:first).flatten
  pos_to_remove.each do |pos|
    names_to_remove_from.each do |name|
      fields_to_positions[name].delete(pos)
    end
  end
end

part2 = fields_to_positions
  .transform_values(&:first)
  .select { |k, v| k =~ /depart/ }
  .map(&:last)
  .map { |i| your_ticket[i] }
  .reduce(&:*)

puts "part 2: #{part2}"
