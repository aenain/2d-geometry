require 'intersectors/any_with_point'

module Intersectors
  class PointWithRectangle < AnyWithPoint
    def initialize(point, rectangle)
      super(rectangle, point)
    end
  end
end