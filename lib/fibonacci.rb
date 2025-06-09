# The following two methods return the specified sequence of fibonacci numbers
# assuming F(1) = 0. For example, fibs(4) returns [0, 1, 1, 2]. The first method
# is iterative and the second method is recursive.

def fibs(num)
  sequence = []
  iterator = 0
  until iterator == num
    sequence << 0 if iterator.zero?
    sequence << 1 if iterator == 1
    sequence << (sequence[-2] + sequence[-1]) if iterator > 1
    iterator += 1
  end
  sequence
end

def fibs_rec(num, sequence = [])
  return sequence if sequence.length == num

  if sequence.empty?
    sequence << 0
  elsif sequence.length == 1
    sequence << 1
  elsif sequence.length > 1
    sequence << (sequence[-2] + sequence[-1])
  end
  fibs_rec(num, sequence)
end
