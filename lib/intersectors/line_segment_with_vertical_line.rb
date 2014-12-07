require 'intersectors/line_with_line_segment'

module Intersectors
  class LineSegmentWithVerticalLine < LineWithLineSegment
    def initialize(segment, line)
      super(line, segment)
    end
  end
end