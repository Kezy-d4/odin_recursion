# Build a method #merge_sort that takes in an array and returns a sorted array,
# using a recursive merge sort methodology. An input of [3, 2, 1, 13, 8, 5, 0, 1]
# should return [0, 1, 1, 2, 3, 5, 8, 13], and an input of [105, 79, 100, 110]
# should return [79, 100, 105, 110].

# Sort the left half of the array.
# Sort the right half of the array.
# Merge the two sorted arrays.

# Helper method to recursively merge two already sorted arrays.
def merge(sorted1, sorted2, merged = []) # rubocop:disable Metrics/AbcSize
  return merged if sorted1.empty? && sorted2.empty?

  array_to_merge_from = sorted1[0] < sorted2[0] ? sorted1 : sorted2
  merged << array_to_merge_from.shift
  sorted1.length.times { merged << sorted1.shift } if sorted2.empty?
  sorted2.length.times { merged << sorted2.shift } if sorted1.empty?
  merge(sorted1, sorted2, merged)
end

# Main method to sort a given array using a recursive merge sort methodology.
def merge_sort(arr)
  return arr if arr.length == 1

  mid_idx = (arr.length - 1) / 2
  sub_arr1 = arr[0..mid_idx]
  sub_arr2 = arr[mid_idx + 1..]
  merge(merge_sort(sub_arr1), merge_sort(sub_arr2))
end

p merge_sort([105, 79, 100, 110])
