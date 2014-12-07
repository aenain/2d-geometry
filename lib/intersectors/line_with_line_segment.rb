module Intersectors
  LineWithLineSegment = Struct.new(:line, :segment) do
    def intersect
      line_intersection = line.intersect(segment.line)
      line_intersection.intersect(segment.rect) if line_intersection
    end

    private :line, :segment
  end
end