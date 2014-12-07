module Intersectors
  class LineWithPoint
    attr_reader :line, :point

    def initialize(line, point)
      @line = line
      @point = point
    end

    def intersect
      point if line.cover?(point)
    end
  end
end