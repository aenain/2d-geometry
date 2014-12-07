require 'intersectors/any_with_point'

module Intersectors
  class PointWithVerticalLine < AnyWithPoint
    def initialize(point, line)
      super(line, point)
    end
  end
end