require 'models/line_segment'

module Intersectors
  RectangleWithVerticalLine = Struct.new(:rect, :line) do
    def intersect
      if rect.range_x.cover?(line.x)
        LineSegment.new(
          Point.new(line.x, rect.min_y),
          Point.new(line.x, rect.max_y)
        )
      end
    end

    private :line, :rect
  end
end