require 'models/point'

module Intersectors
  LineSegmentWithLineSegment = Struct.new(:segment_a, :segment_b) do
    def intersect
      line_intersection = segment_a.intersect_on(segment_b, :line)
      rect_intersection = segment_a.intersect_on(segment_b, :rect)

      if line_intersection && rect_intersection
        line_intersection.intersect(rect_intersection)
      end
    end

    private :segment_a, :segment_b
  end
end