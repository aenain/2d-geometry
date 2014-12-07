module Intersectors
  PointWithVerticalLine = Struct.new(:point, :line) do
    def intersect
      point if line.cover?(point)
    end

    private :point, :line
  end
end