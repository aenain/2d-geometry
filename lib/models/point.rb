class Point
  def initialize(x, y)
    @x = x
    @y = y
  end

  def intersect(point)
    point if self == point
  end

  def ==(other)
    x == other.x && y == other.y
  end

  protected

  attr_reader :x, :y
end