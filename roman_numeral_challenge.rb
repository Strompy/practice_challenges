# Convert an interger into a string of it's Roman Numeral equivalent using a recursive function.
# e.g. `4 => IV`
# Assume no input number will be greater than 4000
#
roman_numerals = {
1000 => "M",
900 => "CM",
500 => "D",
400 => "CD",
100 => "C",
90 => "XC",
50 => "L",
40 => "XL",
10 => "X",
9 => "IX",
5 => "V",
4 => "IV",
1 => "I"
}

def to_roman(num, output = '')
  # - create output string
  return 'invalid input' unless num.class == Integer
  # Break case:
  # - take input and check it for validity (integer (and greater than 0?))\
  if num == 0
    return output
  end

  # Recursive case:
  # - modulo number by 10 and save as current_number variable
  current_number = num % 10


  output << roman_numerals[current_number]
  # - convert current_number into roman numerals
  # - insert/shovel roman numeral in the string

  # - divide number by ten and send result into recursion
  to_roman(num / 10, output)

end

puts to_roman(128)   # should return "CXXVIII"
puts to_roman(2000)  # should return "MM"
puts to_roman(2017)  # should return "MMXVII"
puts to_roman(1999)  # should return "MCMXCIX"
puts to_roman("dd")  # should return "Invalid input"
