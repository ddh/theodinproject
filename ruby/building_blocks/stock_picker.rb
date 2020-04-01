def stock_picker(days_arr)
  result = []
  done = false
  gain = 0
  best_days = []
  days_arr.each {
    |current_day|
    days_arr.each {
      |next_day|
      if days_arr.index(next_day) > days_arr.index(current_day)
        gain = next_day - current_day
        result.push(gain)
      end
    }
  }

  best_gain = result.max

  days_arr.each {
    |current_day|
    days_arr.each {
      |next_day|
      if days_arr.index(next_day) > days_arr.index(current_day)
        if best_gain == next_day - current_day && done == false
          best_days.push(days_arr.index(current_day)).push(days_arr.index(next_day))
          done = true
        end
      end
    }
  }
  puts best_days
end

stock_picker([1, 3, 6, 9, 20, 8, 6, 1, 0])
