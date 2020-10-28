# Palindrome numbers challenge
# Instructions:
# The number 47 has an interesting characteristic.
#
# If you take the number, plus its reverse (47 => 74) and then add them together to a number (47+74=121) the resulting sum is a palindrome
#
# Starting at 0, find the first 25 numbers that have this same characteristic as 47, but limit it to where the palindrome is greater than 1000.
#
# Collect the results in an array. Be sure that you're collecting the interesting numbers like 47, not the palindromic sums.
#
# Bonus points if you can do this without converting numbers to strings/arrays.
#
# Limit your online searches to core language documentation only.


# First solution with string manipulation

def reverse_number(number)
  number.to_s.reverse.to_i
end

def palindrome?(number)
  number == reverse_number(number)
end


def palindromic_numbers(required_amount, min_sum)
  output = []
  number = 0
  until output.length == required_amount do
    total = number + reverse_number(number)
    output << number if palindrome?(total) && total >= min_sum
    number += 1
  end
  output
end


# Second solution with only integers

def reverse_integer(number)
  reverse = 0
  while number > 0 do
    reverse = reverse * 10 # Moves decimal place in final output
    reverse = reverse + (number % 10) # modulo returns last digit of OG num and adds that to current last digit of final output
    number = number / 10 # dividing integer by ten effectively removes last digit
  end
  reverse # return the reversed number
end

def palindromic_numbers(required_amount, min_sum)
  output = []
  number = 0
  until output.length == required_amount do
    total = number + reverse_integer(number)
    output << number if total == reverse_integer(total) && total >= min_sum
    number += 1
  end
  output
end
