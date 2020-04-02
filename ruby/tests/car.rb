module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} gallons of gas per mile"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  attr_accessor :color
  attr_reader :year, :model

  def initialize
    super
  end

  def to_s
    "#{model} is a beautiful #{color}, made in #{year}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Towable
end

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
