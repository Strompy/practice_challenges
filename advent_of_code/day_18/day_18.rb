equations = []
File.readlines('input.txt').each do |line|
  equations << line.chomp
end

test = '1 + 2 * 3 + 4 * 5 + 6'
test2 = '1 + (2 * 3) + (4 * (5 + 6))'

def solve(input)
  i = 0
  sum = nil
  num = nil
  operator = nil
  until i >= input.length
    case input[i] #parse char
    when '+'
      operator = '+'
      i += 1
      next
    when '*'
      operator = '*'
      i += 1
      next
    when ' '
      i += 1
      next
    when '('
      require "pry"; binding.pry
      # change index to skip to after the closing parenthesis
    else
      num = input[i].to_i
      i += 1
    end
    # do the math
    if sum.nil?
      sum = num
    elsif operator == '+'
      sum += num
    elsif operator == '*'
      sum *= num
    end
  end
  sum
end

puts solve(test) == 71
puts solve(test2) == 51
