require_relative 'vertical_line'
require_relative 'line'
require_relative 'rectangle'

LineSegment = Struct.new(:point_a, :point_b) do
  def line
    if point_a.x == point_b.x
      VerticalLine.new(point_a.x)
    else
      Line.from_points(point_a, point_b)
    end
  end

  def rect
    Rectangle.from_points(point_a, point_b)
  end
end