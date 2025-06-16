require "prime"

# Write a recursive method that finds the smallest positive number that is
# evenly divisible by each number from one through twenty.

# Recursive lcm of an array of numbers by the division method
def lcm(list, iterator = 2, primes = [])
  return product(primes) if list.all?(1)

  if iterator.prime? && any_divisible?(list, iterator)
    list = divide_list(list, iterator)
    primes << iterator
  else
    iterator += 1
  end
  lcm(list, iterator, primes)
end

# Helpers
def any_divisible?(list, iterator)
  list.any? { |int| (int % iterator).zero? }
end

def divide_list(list, iterator)
  list.map { |int| (int % iterator).zero? ? int / iterator : int }
end

def product(primes)
  primes.reduce(1) { |product, prime| product * prime }
end

# Driver code
p lcm((1..20).to_a)
