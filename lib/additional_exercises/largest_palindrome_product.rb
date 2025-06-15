# Write a recursive method to find the largest palindromic number made from the
# product of two three-digit numbers.

# Recursive
def largest_palindrome_product(int1 = 999, int2 = 999)
  product = int1 * int2
  return [int1, int2, product] if palindromic_number?(product)

  if int1 == int2
    largest_palindrome_product(int1, int2 - 1)
  elsif int1 != int2
    largest_palindrome_product(int1 - 1, int2)
  end
end

# Helpers
def palindromic_number?(int)
  str = int.to_s
  str == str.reverse
end

# Driver code
p largest_palindrome_product # => [836, 836, 698_896]
