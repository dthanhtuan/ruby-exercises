# Merge sort
def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid...arr.length])

  merge(left, right)
end

def merge(left, right)
  sorted = []
  i = 0
  j = 0

  while i < left.length && j < right.length
    if left[i] < right[j]
      sorted << left[i]
      i += 1
    else
      sorted << right[j]
      j += 1
    end
  end

  # Append any remaining elements
  sorted.concat(left[i..]) if i < left.length
  sorted.concat(right[j..]) if j < right.length

  sorted
end
