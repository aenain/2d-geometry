require_relative 'point'

class Line
  attr_reader :a, :b

  def self.from_points(point_a, point_b)
    a = (point_b.y - point_a.y).to_f / (point_b.x - point_a.x)
    b = point_b.y - a * point_b.x
    new(a, b)
  end

  def initialize(a, b)
    @a = a
    @b = b
  end

  def cover?(point)
    point.y == value(point.x)
  end

  def point_at(x: nil, y: nil)
    return Point.new(x, value(x))    if x
    return Point.new(argument(y), y) if y && argument(y)
  end

  def argument(y)
    return nil if a == 0
    (y - b) / a.to_f
  end

  def value(x)
    a * x + b
  end

  def ==(other)
    a == other.a && b == other.b
  end
end