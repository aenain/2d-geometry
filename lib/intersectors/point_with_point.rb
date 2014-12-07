module Intersectors
  class PointWithPoint
    def initialize(point_a, point_b)
      @point_a = point_a
      @point_b = point_b
    end

    def intersect
      point_a if point_a == point_b
    end

    private

    attr_reader :point_a, :point_b
  end
end