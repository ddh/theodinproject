beer = 99

while (beer != 0)
    puts beer.to_s + " bottles of beer on the wall, " + beer.to_s + " bottles of beer."
    puts "Take one down and pass it around, " + (beer - 1).to_s + " bottles of beer on the wall."
    beer -= 1
end

puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."