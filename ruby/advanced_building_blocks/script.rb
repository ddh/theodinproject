module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_array = []
    self.my_each do |x|
      if yield(x) == true
        new_array = new_array << x
      end
    end
    new_array
  end

  def my_all?
    self.my_each do |x|
      if yield(x) != true
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |x|
      return true if yield(x)
    end
    return false
  end

  def my_none?
    self.my_each do |x|
      return false if yield(x)
    end
    return true
  end

  def my_count(number = nil)
    my_hash = {}
    count = 0
    if number == nil
      if block_given?
        self.each do |x|
          if yield(x)
            count += 1
          end
        end
        return count
      else
        self.each do |x|
          count += 1
        end
        return count
      end
    else
      self.my_each do |x|
        if my_hash[x] == nil
          my_hash[x] = 1
        else
          my_hash[x] += 1
        end
      end
      return my_hash[number]
    end
  end

  def my_map(proc = nil)
    new_array = []
    block_given? ? self.my_each { |x| new_array << yield(x) } : self.my_each { |x| new_array << proc.call(x) }
    new_array
  end

  def my_inject(start = self[0])
    self.my_each do |x|
      start = yield(start, x)
    end
    start
  end
end

def multiply_els(array)
  start = 1
  puts array.my_inject(1) { |prod, num| prod * num }
end

a = [1, 2, 3]
square = Proc.new { |x| x ** 2 }
puts(a.my_map(square) { |x| x ** 2 })
