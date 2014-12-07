module Intersectors
  PointWithPoint = Struct.new(:point_a, :point_b) do
    def intersect
      point_a if point_a == point_b
    end

    private :point_a, :point_b
  end
end