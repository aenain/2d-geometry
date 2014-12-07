class VerticalLine
  attr_reader :x

  def initialize(x)
    @x = x
  end

  def cover?(point)
    x == point.x
  end

  def ==(other)
    x == other.x
  end
end