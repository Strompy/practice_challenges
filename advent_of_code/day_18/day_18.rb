equations = []
File.readlines('input.txt').each do |line|
  equations << line.chomp
end

test = '1 + 2 * 3 + 4 * 5 + 6'
test2 = '1 + (2 * 3) + (4 * (5 + 6))'
test3 = '2 * 3 + (4 * 5)'
test4 = '5 + (8 * 3 + 9 + 3 * 4 * 3)'
test5 = '5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))'
test6 = '((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2'
test7 = '((2 + 2) * (2 + 2) + 2)'

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
    when ')'
      # require "pry"; binding.pry
      i += 1
      return sum
    when '('
      snippet = input[i..-1][/[(] .* [)]/xms]
      # change index to skip to after the closing parenthesis
      require "pry"; binding.pry
      num = solve(snippet[1..-1])
      jump = input[i..-1].chars.find_index(')') + 1
      i += jump
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

# puts solve(test) == 71
# puts solve(test2) == 51
# puts solve(test3) == 26
# puts solve(test4) == 437
# puts solve(test5) == 12240
# puts solve(test6) == 13632
puts solve(test7) == 18
# puts solve(test7)
# puts equations.sum {|e| solve(e)}





# TASKS = File.readlines('input.txt')
#
#
# class Integer
#   alias_method :add, :+
#   alias_method :mult, :*
# end
#
# puts TASKS.sum { |task| eval task.reverse.gsub('+', '.add').gsub('*', '.mult').tr('()', ')(') }
