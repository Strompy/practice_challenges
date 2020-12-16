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
    fields[field] = value
  elsif current_section == 'yours'
    your_ticket = line.chomp.split(',').map(&:to_i)
  elsif current_section == 'tickets'
    tickets << line.chomp.split(',').map(&:to_i)
  end
end
