# Write a method that takes an integer argument (length) and recursively builds
# the fibonacci number sequence up to (length). For example, F(3) should build
# the fibonacci sequence up to the third fibonacci number: 0, 1, 1. Halt the
# construction of the sequence once the value of a fibonacci number exceeds
# four-million. Return the sum of all even numbers in the constructed sequence.

# @param length [Integer] The length of the fibonacci sequence to be generated.
# @return sum [Integer] The sum of all even numbers in the constructed sequence.

# Recursive
def sum_even_fibs(length, sequence = [])
  return invalid_argument_msg unless valid_length?(length)
  return sum_even_numbers(sequence) if base_case?(length, sequence)

  if sequence.empty?
    sequence << 0
  elsif sequence.length == 1
    sequence << 1
  elsif sequence.length > 1
    sequence << (sequence[-2] + sequence[-1])
  end
  sum_even_fibs(length, sequence)
end

# Helpers
def base_case?(length, sequence)
  length == sequence.length || sequence.any? { |num| num > 4_000_000 }
end

def sum_even_numbers(arr)
  arr.reduce(0) { |sum, num| num.even? ? sum + num : sum }
end

def valid_length?(length)
  length.is_a?(Integer) && length >= 0
end

def invalid_argument_msg
  "ERROR—Invalid argument"
end

# Driver code
p sum_even_fibs(10) # => 44
