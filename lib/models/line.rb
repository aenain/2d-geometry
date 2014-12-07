require_relative 'point'

class Line
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  def cover?(point)
    point.y == value(point.x)
  end

  def value(x)
    a * x + b
  end

  def ==(other)
    a == other.a && b == other.b
  end
end