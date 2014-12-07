module Intersectors
  LineWithPoint = Struct.new(:line, :point) do
    def intersect
      point if line.cover?(point)
    end
  end
end