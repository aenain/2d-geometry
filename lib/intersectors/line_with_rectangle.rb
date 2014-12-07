require 'models/line_segment'

module Intersectors
  LineWithRectangle = Struct.new(:line, :rect) do
    def intersect
      left   = line.point_at(x: rect.min_x)
      bottom = line.point_at(y: rect.min_y)
      right  = line.point_at(x: rect.max_x)
      top    = line.point_at(y: rect.max_y)

      common_points = [left, bottom, right, top]
        .compact
        .uniq(&:coords)
        .select { |p| rect.cover?(p) }

      case common_points.count
      when 1 then common_points.first # corner
      when 2 then LineSegment.new(*common_points)
      end
    end

    private :line, :rect
  end
end