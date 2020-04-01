def bubble_sort(array)
  i = 0
  array.size.times do
    i = 0
    while i + 1 < array.size
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
      end
      i += 1
    end
  end
  puts array
end

def bubble_sort_by(array)
  i = 0
  array.size.times do
    i = 0
    while i + 1 < array.size
      if yield(array[i], array[i + 1]) > 0
        array[i], array[i + 1] = array[i + 1], array[i]
      end
      i += 1
    end
  end
  puts array
end

bubble_sort_by(["abc", "ab", "a"]) { |left, right| left.length - right.length }

# bubble_sort([4, 3, 78, 2, 0, 2])
