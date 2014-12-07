require 'range_intersection'
require 'models/line_segment'
require 'models/rectangle'
require 'models/point'

module Intersectors
  RectangleWithRectangle = Struct.new(:rect_a, :rect_b) do
    using RangeIntersection

    def intersect
      range_x = rect_a.range_x & rect_b.range_x
      range_y = rect_a.range_y & rect_b.range_y

      if range_x && range_y
        points = [
          Point.new(range_x.min, range_y.min),
          Point.new(range_x.max, range_y.max),
        ]

        if range_x.min == range_x.max && range_y.min == range_y.max
          points.first
        elsif range_x.min == range_x.max || range_y.min == range_y.max
          LineSegment.new(*points)
        else
          Rectangle.from_points(points)
        end
      end
    end
  end
end