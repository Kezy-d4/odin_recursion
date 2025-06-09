# The following two methods return the specified sequence of fibonacci numbers
# counting from zero, not one. For example, fibs(3) returns [0, 1, 1, 2],
# not [0, 1, 1]. The first method is iterative and the second method is
# recursive.

def fibs(num)
  sequence = []
  iterator = 0
  until iterator > num
    sequence << iterator if (0..1).cover?(iterator)
    sequence << (sequence[-2] + sequence[-1]) if iterator > 1
    iterator += 1
  end
  sequence
end

def fibs_rec(num, iterator = 0, sequence = [])
  return sequence if iterator > num

  sequence << iterator if (0..1).cover?(iterator)
  sequence << (sequence[-2] + sequence[-1]) if iterator > 1
  fibs_rec(num, iterator + 1, sequence)
end
