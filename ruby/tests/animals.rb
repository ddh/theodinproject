class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(color)
    super
    @color = color
  end
end

p sparky = Dog.new("brown")
