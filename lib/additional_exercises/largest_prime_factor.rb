require "prime"
# Write a method that takes an argument (integer) and recursively builds
# (integer)'s series of prime factors before returning its largest prime factor.

# @param integer [Integer] An integer greater than or equal to two.
# @return largest_prime_factor [Integer]

# Recursive
def largest_prime_factor(int, p_f = [], quo = int, ite = 2)
  return invalid_argument_msg unless valid_argument?(int)
  return (p_f << quo).max if quo.prime?
  return p_f.max if quo == 1

  while prime_factor?(quo, ite)
    quo /= ite
    p_f << ite
  end
  largest_prime_factor(int, p_f, quo, ite + 1)
end

# Helpers
# Check if integer2 is a prime factor of integer1.
def prime_factor?(int1, int2)
  int2.prime? && (int1 % int2).zero?
end

def valid_argument?(arg)
  arg.is_a?(Integer) && arg >= 2
end

def invalid_argument_msg
  "ERROR—Invalid argument"
end

# Driver code
int = 600_851_475_143
p largest_prime_factor(int)
