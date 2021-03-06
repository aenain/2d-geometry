class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def coords
    [x, y].map(&:to_f)
  end

  def cover?(point)
    self == point
  end

  def ==(other)
    x == other.x && y == other.y
  end
  alias_method :eql?, :==
end