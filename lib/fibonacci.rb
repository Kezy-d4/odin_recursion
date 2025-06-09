# Method returns specified sequence of fib numbers counting from zero, not one.
# For example, fibs(3) returns [0, 1, 1, 2], not [0, 1, 1].
def fibs(num)
  sequence = []
  i = 0
  until i > num
    sequence << i if (0..1).cover?(i)
    sequence << (sequence[-2] + sequence[-1]) if i > 1
    i += 1
  end
  sequence
end

p fibs(7)
