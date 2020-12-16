fields = Hash.new

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
    require "pry"; binding.pry
  elsif current_section == 'tickets'

  end
end
