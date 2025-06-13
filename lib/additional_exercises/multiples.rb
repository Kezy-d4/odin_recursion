# Write a recursive method that takes a positive or neutral integer (num) and
# returns an array of all integers up to (num) that are multiples of either
# three or five, or an empty array if there are none.

# @param num [Integer]
# @return multiples [Array]

# Recursive
def multiples_of_three_or_five_recursive(num, multiples = [])
  return invalid_argument_msg unless valid_integer?(num)
  return multiples.reverse if num.zero?

  multiples << num if multiple_of_three_or_five?(num)
  multiples_of_three_or_five_recursive(num - 1, multiples)
end

# Iterative
def multiples_of_three_or_five_iterative(num)
  return invalid_argument_msg unless valid_integer?(num)

  multiples = []
  1.upto(num) { |i| multiples << i if multiple_of_three_or_five?(i) }
  multiples
end

# Helpers
def multiple_of_three_or_five?(num)
  (num % 3).zero? || (num % 5).zero?
end

def valid_integer?(num)
  num.is_a?(Integer) && num >= 0
end

def invalid_argument_msg
  "ERROR—Invalid argument"
end

# Driver code
p multiples_of_three_or_five_recursive(20) # => [3, 5, 6, 9, 10, 12, 15, 18, 20]
