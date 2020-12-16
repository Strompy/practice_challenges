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
